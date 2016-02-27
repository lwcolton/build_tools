set -e
. build/set_current_branch.sh
set_current_branch
container_name="***REMOVED******REMOVED***-calculator-test-$current_branch"
docker rm -fv $container_name || true
test_container_id=`docker run --name $container_name -d -w /app ***REMOVED******REMOVED***-calculator:develop /bin/bash -c "while true; do sleep 10; done"`
docker cp test-requires $test_container_id:/tmp/test-requires
docker exec -it "$test_container_id" pip3 install -r /tmp/test-requires
docker exec -it "$test_container_id" pylint -E ***REMOVED******REMOVED***_calculator
docker rm -fv $test_container_id
