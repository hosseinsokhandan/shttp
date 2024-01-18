token="$(echo "$HTTP_AUTHORIZATION" | awk -F' ' '{ print $2}')"
if [ "$(/usr/bin/jwt verify "$token")" != "OK" ]; then
    shttp_status_unauthorized
    echo ""
exit
fi
