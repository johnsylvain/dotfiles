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
  git add .
  gitcb $1
}

function gitcb() {
  local BRANCH_NAME=$(git branch | grep \* | cut -d ' ' -f2)
  local COMMIT_PREFIX=""

  case $BRANCH_NAME in
    chore*) COMMIT_PREFIX="CHORE: ";;
    fix*) COMMIT_PREFIX="FIX: ";;
    feat*) COMMIT_PREFIX="FEAT: ";;
    master) COMMIT_PREFIX="";;
    *) COMMIT_PREFIX="${BRANCH_NAME}: ";;
  esac

  git commit -m "$COMMIT_PREFIX$1"
}

function gitu() {
  git reset HEAD~1
}

function fco() {
  git fetch origin $1
  git checkout $1
}

function hidden() {
  local visible=$(defaults read com.apple.finder AppleShowAllFiles)

  if [[ $visible -eq 1 ]]; then
    defaults write com.apple.finder AppleShowAllFiles -boolean false
    killall Finder
  else
    defaults write com.apple.finder AppleShowAllFiles -boolean true
    killall Finder
  fi
}

function new() {
  mkcd $1
  npm init -y
  git init
  gitignore node
}

function extract() {
  if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.ext"
  else
    for n in "$@"
    do
      case "${n%,}" in
        *.tar|*.tgz) tar -xzvf "$n";;
        *.gz) gunzip -k "$n";;
        *.zip) unzip "./$n";;
        *)
          echo "Cannot extract $n"
          return 1
        ;;
      esac
    done
  fi
}
