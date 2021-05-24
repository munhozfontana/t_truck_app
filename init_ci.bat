@ECHO OFF
ECHO INIT docker-compose
docker image prune -f
docker-compose up --build -d web ngrok 
ECHO FINISH docker-compose
