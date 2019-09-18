# Voyce Web Dashboard

Este projeto possui uma pasta chamada "docker", dentro desta tem um arquivo chamado docker-compose.yml que é responsável por construir o ambiente de desenvolvimento completo para o projeto.

# Instalar o Docker e Docker-Compose

Para utilizar o ambiente que foi projetado utilizando o docker, é necessário que tenha instalado em sua maquina o `docker` e `docker-compose`, assim, evitando quaisquer conflitos e dificuldades em executar o ambiente.

- [Instalar Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce)
- [Instalar Docker-Compose](https://docs.docker.com/compose/install/#install-compose)

# Utilizando o Docker

Ao clonar o projeto, basta acessar a pasta `docker` e executar o comando abaixo:

``
    $ docker-compose build
    $ docker-compose up -d
``

Após a execução do comando acima, seu ambiente estará pronto.

Os seguintes containers serão disponibilizados:

- application - Container da aplicação com Ruby e Ruby on Rails

# Executando o projeto dentro do container

Para acessar o ambiente de desenvolvimento dentro do Container, execute o seguinte comando:

``
    $ docker exec -it application bash
``

- Instale as dependências da aplicação `` bundle install ``
- Rode o servidor `` bundle exec puma -p 3000 ``
- Abra seu navegador `` http://localhost:3000 ``


# Banco de Dados

A aplicação utiliza o banco de dados Google Cloud Firestore, com isso, para uso 
da aplicação, é necessário a criação de um projeto no Firestore ou baixar o arquivo com as credenciais para acesso via ambiente de desenvolvimento.

Para mais informações, acesse a [Documentação do Google Cloud Firestore WEB](https://firebase.google.com/docs/web/setup#config-web-app)

# Tecnologias utilizadas

- Ruby 2.6.3
- Ruby on Rails 6.0.0
- Docker
- Docker Compose
- [Google Cloud Firebase](https://firebase.google.com/docs/web/setup)
- [Google Cloud Firestore](https://firebase.google.com/docs/firestore/quickstart)
- [Google Cloud Storage](https://github.com/googleapis/google-cloud-ruby/tree/master/google-cloud-storage)