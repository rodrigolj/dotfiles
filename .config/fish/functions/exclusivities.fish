set -f staging "https://staging.orulo.com.br"
set -f prod "https://www.orulo.com.br"
docker run --rm -e ORULO_BASE_URL=$argv[1] -e ORULO_WRITE_EXCLUSIVITIES="$argv[2]"
-v $(pwd):/opt/app -w /opt/app php script/run_import.sh $argv[3] $argv[4]
