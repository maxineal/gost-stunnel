#!/bin/bash
echo Configuring socat...

socatParameters="TCP:${STUNNEL_HOST}"

if [[ -n "STUNNEL_HTTP_PROXY" ]]; then
    # если указан http-прокси, подключение будет происходить через него
    socatParameters="PROXY:${STUNNEL_HTTP_PROXY}:${STUNNEL_HOST},proxyport=${STUNNEL_HTTP_PROXY_PORT}"

    if [[ -n "$STUNNEL_HTTP_PROXY_CREDENTIALS" ]]; then
        socatParameters="${socatParameters},proxyauth=${STUNNEL_HTTP_PROXY_CREDENTIALS}"
    fi
fi

socatCmd="socat UNIX-LISTEN:/var/run/socat.sock,reuseaddr,fork ${socatParameters}"

while true; do
    rm -f /var/run/socat.sock
    echo $(date) "Start socat instance."
    ${socatCmd}
    sleep 1
done