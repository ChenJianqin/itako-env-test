#!/bin/bash

export LANG=C
set -eu

# init/funcs
__DIR_NAME=`which dirname`
__BASE_NAME=`which basename`
__execpath(){
  if [ ! -e "$1" ]; then
    return 1
  fi
  pushd `${__DIR_NAME} $1` >/dev/null 2>&1
  [ $? -eq 1 ] && exit 1
  _dir=`pwd`
  popd >/dev/null 2>&1
  echo ${_dir}
}
__SCRIPT_DIR=`__execpath $0`

log() {
  echo "[LOG] $1"
}

# const
declare -a repos=(
"git@github.com:cam-inc/sms.git lib 3.0.x"
"git@github.com:cam-inc/fortune.git fortune ver.3.0.0"
"git@github.com:cam-inc/itako-server.git itako"
)

# git clone
init() {
  for ((i = 0; i < ${#repos[@]}; i++)) {
    _url=`echo ${repos[i]} | cut -d' ' -f1`
    _name=`echo ${repos[i]} | cut -d' ' -f2`
    _branch=`echo ${repos[i]} | cut -d' ' -f3`
    if [ -d ./${_name} ]; then
      log "[SKIP] git clone. ${_url} ${_name}"
    else
      log "[INFO] init ${_name}"
      git clone ${_url} ${_name}

      pushd ${_name}

      if [ "x${_branch}" != "x" ]; then
        log "[INFO] change branch ${_branch}"
        git checkout ${_branch}
      else
        log "[SKIP] change branch ${_branch}"
      fi

      git branch -a # print

      popd
    fi
  }
}

# git clone removes
clean() {
  for ((i = 0; i < ${#repos[@]}; i++)) {
#    _url=`echo ${repos[i]} | cut -d' ' -f1`
    _name=`echo ${repos[i]} | cut -d' ' -f2`
#    _branch=`echo ${repos[i]} | cut -d' ' -f3`
    if [ ! -d ./${_name} ]; then
      log "[SKIP] git reposigory remove. ${_name}"
    else
      rm -rf ./${_name}
    fi
  }
}

reset() {
  for ((i = 0; i < ${#repos[@]}; i++)) {
#    _url=`echo ${repos[i]} | cut -d' ' -f1`
    _name=`echo ${repos[i]} | cut -d' ' -f2`
    _branch=`echo ${repos[i]} | cut -d' ' -f3`
    echo "== repo: ${_name}, branch: ${_branch}"
    if [ ! -d ./${_name} ]; then
      log "[SKIP] git reposigory remove. ${_name}"
    else
      pushd ${_name}
      git fetch --all
      git reset --hard origin/${_branch}
      popd
    fi
  }



}

usage() {
  cat <<_EOT_
Usage:
  $0 [init|clean]

Description:
  リポジトリ管理スクリプト

Options:
  no set

_EOT_
  exit 2
}

# run!!
if [ "x$1" == "xinit" ]; then
  init
elif [ "x$1" == "xclean" ]; then
  clean
elif [ "x$1" == "xreset" ]; then
  reset
else
  usage
fi
