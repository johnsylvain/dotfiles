function mkcd() {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir -p $1 && cd $1
  fi
}

function mark() {
  export RECALL_TO=$(pwd)
  echo -e "to return to ${RECALL_TO}:\n$ recall"
}

function recall() {
  cd "${RECALL_TO}"
  pwd; ls
}

function gitignore() {
  curl -L -s "https://www.gitignore.io/api/$1" >> .gitignore
}

function cheat() {
  curl -L -s "http://cheat.sh/$1"
}

function gitca() {
  local BRANCH_NAME=$(git branch | grep \* | cut -d ' ' -f2)
  git add .
  git commit -m "$BRANCH_NAME: $1"
}