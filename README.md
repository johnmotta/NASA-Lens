# NASA Lens

NASA Lens é um aplicativo iOS que utiliza a API da NASA para exibir fotos capturadas pelo rover Curiosity em Marte. Os usuários podem explorar as fotos do rover, visualizar detalhes sobre a câmera utilizada e navegar entre telas para ver mais informações detalhadas de cada imagem.

| Fotos do dia | Fotos de Marte | Detalhes de Marte | Asteroides próximos da Terra |
|:-------------------------:|:-----------------:|:----------------:|:-------------:|
| <img src="https://i.imgur.com/CgPMc0f.png" width="200"/> | <img src="https://i.imgur.com/wlkc5ND.png" width="200"/> | <img src="https://i.imgur.com/yDA46Xu.png" width="200"/> |  <img src="https://i.imgur.com/4yQaSRy.png" width="200"/> |



## Funcionalidades

- **Exploração de Fotos**: Listagem de fotos tiradas pelo rover Curiosity em Marte.
- **Detalhes das Imagens**: Visualização detalhada das fotos, incluindo informações sobre a câmera, data e rover.
- **Navegação Intuitiva**: Navegação entre telas para explorar mais detalhes de cada foto.
- **Carregamento de Imagens**: Imagens carregadas de forma assíncrona com placeholders em caso de atraso no carregamento.
- **Visualização de Asteroides**: Acesso a informações sobre asteroides próximos à Terra.
- **Imagem do Dia**: Exibição da imagem astronômica do dia, mostrando conteúdo novo e interessante a cada dia.

## Requisitos

- iOS 13.0 ou superior
- Xcode 14.0 ou superior
- Swift 5.7 ou superior

## Instalação

1. Clone o repositório para sua máquina local:

2. Abra o projeto no Xcode:

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

## Telas do Aplicativo

### APOD

- **Descrição**: Tela que exibe a imagem astronômica do dia.
- **Funcionalidade**: Carrega e apresenta a imagem do dia, com opções de erro para exibir mensagens relevantes.

### MarsRover

- **Descrição**: Tela que apresenta uma coleção de fotos do rover Curiosity.
- **Funcionalidade**: Carrega fotos da API e permite a navegação para uma tela de detalhes ao selecionar uma imagem.

### Asteroid

- **Descrição**: Tela que lista asteroides próximos à Terra.
- **Funcionalidade**: Mostra uma tabela de asteroides, permitindo ao usuário visualizar informações detalhadas.


## Estrutura de Arquivos

```bash
├── NASA Lens/
│   ├── APOD/
│   │   ├── Model/
│   │   ├── View/
│   │   ├── ViewModel/
│   ├── Asteroid/
│   │   ├── Model/
│   │   ├── View/
│   │   ├── ViewModel/
│   ├── MarsRover/
│   │   ├── Model/
│   │   ├── View/
│   │   ├── ViewModel/
│   ├── Service/
│   ├── Source/
```
