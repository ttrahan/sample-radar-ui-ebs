#!/bin/bash -e


convert_dockercfg_v1() {
  config=""
  var CFG_FILE_NAME = "";
  if [ -f ~/.dockercfg ]; then
    CFG_FILE_NAME=~/.dockercfg
  elif [ -f ~/.docker/config.json ]; then
    CFG_FILE_NAME=~/.docker/config.json
  fi
  echo "$CFG_FILE_NAME"
  if [ ! -z "$CFG_FILE_NAME" ]; then
    config=$(cat "$CFG_FILE_NAME" | python -c 'import json,sys;jsonObj=json.load(sys.stdin).get("auths", "");print json.dumps(jsonObj);')
    if [ "$config" != "\"\"" ]; then
      CFG_FILE_NAME=~/finalcfg.json
      echo "$config" > "$CFG_FILE_NAME"
    fi
  fi
}

convert_dockercfg_v1()
