
#!/bin/sh

# set -u

# User params
KIBANA_USER_PARAMS=$@
KIBANA_CONFIG=${KIBANA_CONFIG}

# Internal params
KIBANA_CMD="${KIBANA_HOME}/bin/kibana ${KIBANA_USER_PARAMS}"

#######################################
# Echo/log function
# Arguments:
#   String: value to log
#######################################
log() {
  if [[ "$@" ]]; then echo "[`date +'%Y-%m-%d %T'`] $@";
  else echo; fi
}


#######################################
# Dump current $KIBANA_CONFIG
#######################################
print_config() {
  log "Current Kibana config $KIBANA_CONFIG:"
  printf '=%.0s' {1..100} && echo
  cat $KIBANA_CONFIG
  printf '=%.0s' {1..100} && echo
}

# Modify Kibana config
if [[ -n "$ELASTICSEARCH_URL" ]]; then
	sed -ri "s|.*(elasticsearch\.url: ).*$|\1\"$ELASTICSEARCH_URL\"|" $KIBANA_CONFIG
fi
if [[ -n "$ES_USER" ]]; then
	sed -ri "s|.*(elasticsearch\.username: ).*$|\1\"$ES_USER\"|" $KIBANA_CONFIG
fi
if [[ -n "$ES_PASSWORD" ]]; then
	sed -ri "s|.*(elasticsearch\.password: ).*$|\1\"$ES_PASSWORD\"|" $KIBANA_CONFIG
fi

# Launch Kibana
log $KIBANA_CMD && print_config
$KIBANA_CMD
# Exit immidiately in case of any errors or when we have interactive terminal
if [[ $? != 0 ]] || test -t 0; then exit $?; fi
log "Kibana started with $KIBANA_CONFIG config" && log
