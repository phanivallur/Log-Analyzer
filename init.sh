#!/bin/bash
#:######################################################################################
#: CODING CONVENTIONS
#:  - No TABS, please use spaces with tab width as 2
#:
#: Sample usage for only alias verification:
#:    ./bdm-es-index-alias.sh -c -l node_username -a node_password
#:######################################################################################
#: Please update the versions
_version=3
set -x
#:default environment (DEV|TEST|PRD|DR)
#IMPLEMENTATION_ENVIRONMENT=
#:--  ARG Parsing - DO NOT MODIFY unless you know what you are doing.
#:---

while getopts :hce:l:a: PARAM 2>/dev/null
do
  case ${PARAM} in
    h)
      _usage $0
      ;;
    c)
      CONSOLE_LOG=yes
      ;;
    i)
      INPUT_INSTANCE=$OPTARG
      ;;
   \?)
      echo "unrecognized option: ${PARAM}"
      _usage $0
      ;;
  esac
done

function get_db_name(){
    local in_inst=$1

    ruckus -b "${in_inst}" d | cut -d " " -f1
}


#:###################################################################################
#:                              Main Program
#:###################################################################################

function Main() {

  #create a  list of all bz2 files
  declare -a _list=()
  input_tar=
  input_year=
  rootDir="/transfer/bdm/"
  
  if [[ -Z  ${INPUT_INSTANCE} ]]
  then
   log_it "Input instance should be provided. Please run the script again with input instance"
   exit 1
  fi 
  
  get_db_name "${INPUT_INSTANCE}"



Main
exit $?
