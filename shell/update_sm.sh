#!/bin/bash
# ------------------------------------------------------------------
# [Siim Reinart]
# update_sm.sh
#          This script updates the servicematrix for the database
#          server.
# Changelog:
# 0.1.0 15.03.2016 - Initial version
# ------------------------------------------------------------------

USAGE="Usage: update_sm.sh [-t TASK_NUMBER_IN_SNOW] [-s SINGLE_DB_SERVER]"
get_snow=get_snow_ci.pl
set -e

SNOW_TASK=""
DB_SERVER=""
ASK_PASS=""

while [ $# -gt 0 ] ; do
    case "$1" in
    -h|--help)
        echo $USAGE
        ;;
    -t)
        SNOW_TASK=$2
        ;;
    -s)
        DB_SERVER="$2"
        ;;
    -p)
        ASK_PASS="y"
        ;;
    -*)
        echo "Unknown option '$1'"
        exit
        ;;

    esac
    shift
done

SITE_LIST=""
function snow_task_query {
  SITE_LIST=`${get_snow} ${SNOW_TASK}`
}

function exec_pssh {
  if [ "${ASK_PASS}" = "y" ]; then
          parallel-ssh -A -H "${SITE_LIST}" "sudo -i /opt/servicematrix/PlaytechService.rb --report"
  else
          parallel-ssh -H "${SITE_LIST}" "sudo -i /opt/servicematrix/PlaytechService.rb --report"
  fi
}


if [ $SNOW_TASK ]; then
  snow_task_query
echo $SITE_LIST
        if [ "${SITE_LIST}" ]; then
                exec_pssh
        else
           echo "empty response from SERVICE NOW query"
        fi
elif [ $DB_SERVER ]; then
        SITE_LIST=$DB_SERVER
        exec_pssh
fi
