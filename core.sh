source ./shttp/vars.sh


# Status
shttp_status_ok() {
  echo "Status: 200 OK"
}

shttp_status_created() {
  echo "Status: 201 Created"
}

shttp_status_accepted() {
  echo "Status: 202 Accepted"
}

shttp_status_badrequest() {
  echo "Status: 400 Bad Request"
}

shttp_status_unauthorized() {
  echo "Status: 401 Unauthorized"
}

shttp_status_forbidden() {
  echo "Status: 403 Forbidden"
}

shttp_status_notfound() {
  echo "Status: 404 Not Found"
}

shttp_status_methodnotallowed() {
  echo "Status: 405 Method Not Allowed"
}

shttp_status_conflict() {
  echo "Status: 409 Conflict"
}


# Response
shttp_response() {
  content_type=$1
  body=$2

  echo $content_type  
  echo ""
  echo $body
}


shttp_response_json() {
  content_type="Content-Type: application/json"
  body=$1
  shttp_response "$content_type" "$body"
}


shttp_response_text() {
  content_type="Content-Type: plain/text"
  body=$1
  shttp_response "$content_type" "$body"
}


shttp_response_empty() {
  echo ""
}


# shttp request handling
shttp_dispatch() {
  if [[ -n $REQUEST_METHOD ]]; then
    handler="shttp_$(echo "$REQUEST_METHOD" | awk '{print tolower($0)}')"
    
    if $(type -t "$handler" >/dev/null); then
      eval "$handler"
    else
      shttp_status_methodnotallowed
      shttp_response_empty
    fi
  fi
}
