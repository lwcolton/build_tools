set -e
docker_login_cmd=`aws ecr get-login --region us-east-1`
$docker_login_cmd
. build-tools/set_current_branch.sh
pushd packer_build/
set_current_branch
./pre_build.sh
packer build --only=docker -var "current_branch=$current_branch" packer.json
popd
