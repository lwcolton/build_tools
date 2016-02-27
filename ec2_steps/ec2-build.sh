set -e
. build-tools/set_current_branch.sh
set_current_branch
pushd build
./pre_build.sh
ami_timestamp=`echo 'import datetime; print(datetime.datetime.now().strftime("%Y-%m-%d_%H.%M.%S"))' |python3`
packer build --only=amazon-ebs -var "current_branch=$current_branch" -var "ami_timestamp=$ami_timestamp" packer.json
popd
