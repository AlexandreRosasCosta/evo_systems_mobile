# Evo Systems Mobile

**Evo Systems Mobile** é um aplicativo desenvolvido em Flutter como parte de um desafio técnico. O aplicativo é uma plataforma de filmes que permite aos usuários navegarem por diferentes filmes, visualizar detalhes de cada um deles, realizar buscas por nome e, em breve, adicionar filmes aos favoritos e utilizar tradução automática.

## Funcionalidades

- **Navegação por Filmes:** Exibe uma lista de filmes divididos em seções como "Mais Avaliados" e "Em Breve".
- **Busca:** Permite aos usuários pesquisar filmes pelo nome.
- **Detalhes do Filme:** Exibe informações detalhadas sobre o filme, incluindo resumo, data de lançamento e avaliações.
- **Tradução Automática:** Implementação de tradução automática de resumos para o idioma com base nas preferências do usuário usando o Google Translator (em andamento).
- **Página de Favoritos:** Funcionalidade futura que permitirá ao usuário marcar filmes como favoritos.

## Estrutura do Projeto

O projeto segue uma estrutura organizada para facilitar a manutenção e escalabilidade:

- lib/
    - api/
        - api_films.dart                # Interação com APIs externas para buscar dados de filmes
    - models/
        - films.dart                    # Modelo de dados para os filmes
    - page/
        - details.dart                  # Página de detalhes do filme
        - home.dart                     # Página inicial exibindo categorias de filmes
        - search.dart                   # Página de pesquisa de filmes
    - services/
        - translator.dart               # Serviço de tradução de texto usando Google Translator
    - utils/
        - default_constants.dart        # Arquivo de constantes (deve ser renomeado e configurado)
        - formatters.dart               # Funções de formatação, como datas
    - widgets/
        - back_btn.dart                 # Widget para o botão de voltar
        - film_slider.dart              # Widget para exibir carrossel de filmes
        - main_slider.dart              # Widget para o carrossel principal da tela inicial
        - overview_translator.dart      # Widget para tradução e exibição do resumo do filme
    - main.dart # Ponto de entrada do aplicativo

## Configuração Inicial

Antes de executar o projeto, é necessário configurar o arquivo de constantes:

1. **Renomeie o arquivo `default_constants.dart` para `constants.dart`.**

2. **Atualize os valores das constantes:**
   - **`apiKey:`** Insira a chave da API TMDB.
   - **`images:`** Especifique a URL base das imagens.
   - **`backgroundColor:`** Defina a cor de fundo.
   - **`ratingColor:`** Defina a cor de avaliação.
   - **`currentLanguage:`** Especifique o idioma padrão (ex: `en` para inglês).

## Como Executar

1. **Clone o repositório:**
   git clone https://github.com/AlexandreRosasCosta/evo_systems_mobile.git

2. **Renomeie e configure o arquivo default_constants.dart conforme instruído acima.**

3. **Instale as dependências:**
    flutter pub get

4. **Execute o aplicativo:**
    flutter run

## Funcionalidades Futuras

- **`Favoritos:`** Permitir que os usuários marquem filmes como favoritos.
- **`Tradução:`** Tradução automática para diferentes idiomas com base na preferência do usuário.

## Licença
Este projeto está licenciado sob os termos da licença MIT.
