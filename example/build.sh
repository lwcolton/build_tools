packer build --only=docker packer.json
pushd ../
./docker-test.sh
