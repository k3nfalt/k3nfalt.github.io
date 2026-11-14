set -eu
cd "$(dirname "$0")"

if [ "${1:-}" = "update-longtail" ]; then
    site="$HOME/repos/longtails/server/public"
    if [ ! -f "$site/index.html" ] || [ ! -f "$site/sitemap.xml" ] || [ ! -f "$site/assets/catalog.json" ]; then
        echo "Build LongTails first: cd ~/repos/longtails && python3 -m server.build --render-only" >&2
        exit 1
    fi
    rm -rf source/static/longtails longtails
    mkdir -p source/static/longtails
    rsync -a --delete "$site/" source/static/longtails/
    mkdir -p longtails
    rsync -a --delete "$site/" longtails/
    exit 0
fi
cd ./source && hugo -d "../"
