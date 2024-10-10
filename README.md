# NASA Lens

NASA Lens é um aplicativo iOS que utiliza a API da NASA para exibir fotos capturadas pelo rover Curiosity em Marte. Os usuários podem explorar as fotos do rover, visualizar detalhes sobre a câmera utilizada e navegar entre telas para ver mais informações detalhadas de cada imagem.

## Funcionalidades

- Listagem de fotos tiradas pelo rover Curiosity em Marte.
- Visualização detalhada das fotos com informações sobre a câmera e data.
- Navegação entre telas para explorar mais detalhes de cada foto.
- Imagens carregadas de forma assíncrona e com placeholder em caso de atraso no carregamento.

## Requisitos

- iOS 13.0 ou superior
- Xcode 14.0 ou superior
- Swift 5.7 ou superior

## Instalação

1. Clone o repositório para sua máquina local:

    ```bash
    git clone https://github.com/seu-usuario/nasa-lens.git
    ```

2. Abra o projeto no Xcode:

    ```bash
    cd nasa-lens
    open NASA_Lens.xcodeproj
    ```

3. No arquivo `Constants.swift`, adicione sua chave de API da NASA:

    ```swift
    struct Constants {
        static let API = "SUA_API_KEY_AQUI"
    }
    ```

4. Compile e rode o aplicativo no simulador ou em um dispositivo físico.

## Tecnologias Utilizadas

- **UIKit**: Utilizado para construir as telas e componentes da interface.
- **SDWebImage**: Usado para carregar e cachear imagens de forma assíncrona.
- **API da NASA**: Para obter as fotos tiradas pelo rover Curiosity em Marte.
- **Auto Layout com Constraints Programáticas**: Layout configurado diretamente via código.

## Arquitetura

Este projeto segue uma arquitetura baseada em MVVM (Model-View-ViewModel):

- **Model**: Representa as estruturas de dados e modelos utilizados na aplicação, como `MarsRoverPhoto`, `Rover`, `Camera`.
- **View**: Componentes visuais, como células da tabela e a interface gráfica.
- **ViewModel**: Lógica de negócio e comunicação entre as views e os dados da API.
- **Service**: Gerenciamento de chamadas HTTP e comunicação com a API da NASA.

## Estrutura de Arquivos

```bash
├── NASA Lens/
│   ├── Home/
│   │   ├── Model/
│   │   ├── View/
│   │   ├── ViewModel/
│   ├── Service/
│   ├── Source/
