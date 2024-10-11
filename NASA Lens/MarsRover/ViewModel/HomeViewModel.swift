//
//  HomeViewModel.swift
//  NASA Lens
//
//  Created by John Motta on 10/10/24.
//

import Foundation

class HomeViewModel {
    private let serviceManager = ServiceManager.shared

    var isLoading: Bool = false
    var onDataUpdated: (() -> Void)?
    var onError: ((Error) -> Void)?

    var photos: [MarsRoverPhoto] = [] 

      func fetchData() {
          isLoading = true
          serviceManager.fetchData { [weak self] result in
              DispatchQueue.main.async {
                  self?.isLoading = false
                  switch result {
                  case .success(let photos):
                      self?.photos = photos
                      self?.onDataUpdated?()
                  case .failure(let error):
                      self?.onError?(error)
                  }
              }
          }
      }
}
