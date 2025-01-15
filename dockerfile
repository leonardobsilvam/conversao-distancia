# Imagem coletada no Docker HUB + TAG
FROM python:3.13.0 
# Diretório de trabalho 
WORKDIR /app 
# Comando para baixar as depencendias(contino no diretorio)
COPY requirements.txt .
#Baixar e instalar todas dependencias
RUN pip install -r requirements.txt 
#Copia todo conteudo do diretorio conversao-distancia para o diretorio app
COPY . /app/
#Declara porta 5000
EXPOSE 5000
#Comando de inicializacao do container - CMD só pe executado na criação do container e não na criação da imagem
CMD [ "gunicorn","--bind","0.0.0.0:5000","app:app" ]


