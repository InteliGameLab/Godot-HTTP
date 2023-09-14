# Godot-HTTP

## Requisitos

Para utilizar essa aplicação, é necessário ter o Python previamente instalado, assim como o Sqlite3.

Após isso, é necessário instalar o Flask, que é o framework utilizado para a criação da API. Para isso, basta executar o seguinte comando no terminal:

    pip install -r requirements.txt

Esse comando irá instalar todas as dependências necessárias para a execução da aplicação, contidas no arquivo `requirements.txt`.

## Execução

Para executar a aplicação, basta executar o seguinte comando no terminal:

    python main.py

Após isso, a aplicação estará disponível no endereço `http://localhost:5000/`

## Rotas

A aplicação possui as seguintes rotas:

### GET / - Retorna todos os players e as suas pontuações

### POST /post - Cria um novo player caso ele não exista, ou atualiza a pontuação do player caso ele já exista
