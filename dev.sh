HOST=gabrielcarioca.busercamp.com.br

function devhelp() {
  echo "dkbuild constroi a imagem docker"
  echo "dkrun roda o projeto dockerizado"
  echo "deploy  deploy no projeto"
  }

function dkbuild() {
  docker build -t gabrielcarioca .
}

function dkrun() {
  docker run -it -p 8000:8000 \
  -e DATABASE_FILE=/dkdata/db.sqlite3 \
  -e DJANGO_STATIC_ROOT=/dkdata/static \
  -v $(pwd)/dkdata:/dkdata \
  gabrielcarioca start.sh
}
function deploy() {
  rsync -av --exclude dkdata  --exclude dv.sqlite3 \
  ./* ubuntu@$HOST:./gabrielcarioca/
  ssh ubuntu@$HOST "cd gabrielcarioca && ./dkrunprod.sh"
}
devhelp