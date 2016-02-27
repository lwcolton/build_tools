set -e
. build/set_current_branch.sh
set_current_branch
if [ -z $LOCAL_REPO ]; then
    echo Need LOCAL_REPO variable
    exit 1
fi
if [ -z $APP_NAME ]; then
    echo Need APP_NAME variable
    exit 1
fi
container_name="$LOCAL_REPO:$current_branch"
docker rm -fv $container_name || true
test_container_id=`docker run --name $container_name -d -w /app container_name /bin/bash -c "while true; do sleep 10; done"`
docker cp test-requires $test_container_id:/tmp/test-requires
docker exec -it "$test_container_id" pip3 install -r /tmp/test-requires
docker exec -it "$test_container_id" pylint -E $APP_NAME
docker rm -fv $test_container_id
