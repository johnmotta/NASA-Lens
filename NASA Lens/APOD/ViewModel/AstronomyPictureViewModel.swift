//
//  AstronomyPictureViewModel.swift
//  NASA Lens
//
//  Created by John Motta on 13/10/24.
//

import Foundation

class AstronomyPictureViewModel {
    var astronomyPicture: Apod?
    var onDataUpdated: (() -> Void)?
    var onError: ((Error) -> Void)?

    func loadAstronomyPictures() {
        ServiceManager.shared.fetchLoadAstronomyPictures { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let picture):
                    self?.astronomyPicture = picture
                    self?.onDataUpdated?()
                case .failure(let error):
                    self?.onError?(error)
                }
            }
        }
    }
}
