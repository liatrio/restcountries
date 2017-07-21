#!/bin/bash
endpoint="all"
curl="$(curl -sI http://localhost:8080/restcountries-2.0.2/rest/v2/"$endpoint" | head -1 | grep -oE '200')"
success=200
if [ "$curl" == "$success" ]; then
        echo "success... "
else
        exit 1;
fi

curl=
endpoint=
endpoint="name/united"
curl="$(curl -sI http://localhost:8080/restcountries-2.0.2/rest/v2/"$endpoint" | head -1 | grep -oE '200')"
if [ "$curl" == "$success" ]; then
        echo "success... "
else
        echo "curl command failed."
        exit 1;
fi

curl=
endpoint=
endpoint="name/aruba?fullText=true"
curl="$(curl -sI http://localhost:8080/restcountries-2.0.2/rest/v2/"$endpoint" | head -1 | grep -oE '200')"
if [ "$curl" == "$success" ]; then
        echo "success... "
else
        echo "curl command failed."
        exit 1;
fi

curl=
endpoint=
endpoint="alpha/co"
curl="$(curl -sI http://localhost:8080/restcountries-2.0.2/rest/v2/"$endpoint" | head -1 | grep -oE '200')"
if [ "$curl" == "$success" ]; then
        echo "success... "
else
        echo "curl command failed."
        exit 1;
fi

curl=
endpoint=
endpoint="alpha?codes=col;no;ee"
curl="$(curl -sI http://localhost:8080/restcountries-2.0.2/rest/v2/"$endpoint" | head -1 | grep -oE '200')"
if [ "$curl" == "$success" ]; then
        echo "success... "
else
        echo "curl command failed."
        exit 1;
fi

curl=
endpoint=
endpoint="currency/cop"
curl="$(curl -sI http://localhost:8080/restcountries-2.0.2/rest/v2/"$endpoint" | head -1 | grep -oE '200')"
if [ "$curl" == "$success" ]; then
        echo "success... "
else
        echo "curl command failed."
        exit 1;
fi

curl=
endpoint=
endpoint="lang/es"
curl="$(curl -sI http://localhost:8080/restcountries-2.0.2/rest/v2/"$endpoint" | head -1 | grep -oE '200')"
if [ "$curl" == "$success" ]; then
        echo "success... "
else
        echo "curl command failed."
        exit 1;
fi

curl=
endpoint=
endpoint="capital/tallinn"
curl="$(curl -sI http://localhost:8080/restcountries-2.0.2/rest/v2/"$endpoint" | head -1 | grep -oE '200')"
if [ "$curl" == "$success" ]; then
        echo "success... "
else
        echo "curl command failed."
        exit 1;
fi

curl=
endpoint=
endpoint="callingcode/372"
curl="$(curl -sI http://localhost:8080/restcountries-2.0.2/rest/v2/"$endpoint" | head -1 | grep -oE '200')"
if [ "$curl" == "$success" ]; then
        echo "success... "
else
        echo "curl command failed."
        exit 1;
fi

curl=
endpoint=
endpoint="region/europe"
curl="$(curl -sI http://localhost:8080/restcountries-2.0.2/rest/v2/"$endpoint" | head -1 | grep -oE '200')"
if [ "$curl" == "$success" ]; then
        echo "success... "
else
        echo "curl command failed."
        exit 1;
fi

curl=
endpoint=
endpoint="failure"
curl="$(curl -sI http://localhost:8080/restcountries-2.0.2/rest/v2/"$endpoint" | head -1 | grep -oE '200')"
if [ "$curl" == "$success" ]; then
        echo "success... "
else
        echo "curl command failed."
        exit 1;
fi
