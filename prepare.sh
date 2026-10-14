if [ "${1:-}" = "update-longtail" ]; then
    cp ~/repos/longtails/server/index.html source/static/longtails/index.html || exit $?
fi
cd ./source && hugo -d "../"
