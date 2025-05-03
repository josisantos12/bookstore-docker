# Usa a imagem base do Python 3.13.3 com Alpine Linux, que é leve e otimizada
FROM python:3.13.3-alpine

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de dependências para o contêiner
COPY requirements.txt /app/

# Instala as dependências necessárias para o MySQL
RUN apk add --no-cache mariadb-connector-c-dev gcc python3-dev musl-dev libffi-dev

# Instala o cliente MySQL
RUN apk add --no-cache mysql-client

# Instala as dependências do Python sem armazenar cache, para manter a imagem leve
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o código do projeto para o diretório do contêiner
COPY . /app/

# Expõe a porta 8000 para acessar a aplicação externamente
EXPOSE 8000

# Define o comando que será executado ao iniciar o contêiner
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]