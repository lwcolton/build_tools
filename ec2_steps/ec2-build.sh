set -e
. build-tools/set_current_branch.sh
set_current_branch
. build-tools/set_project_name.sh

if [ -f ./packer_build/pre_build.sh ]; then
    ./packer_build/pre_build.sh
fi


rm -rf packer_build/build_files/requirements
mkdir -p packer_build/build_files/requirements
cp requirements.txt packer_build/build_files/requirements.txt
if [ -f download_internal_requirements.sh ]; then
    echo "Download internal requirements"
    ./download_internal_requirements.sh
fi

timestamp=`echo 'import datetime; print(datetime.datetime.now().strftime("%Y-%m-%d_%H.%M.%S"))' |python3`
if [ "$current_branch" == "master" ]; then
    ami_name="$project_name"
else
    ami_name="$project_name - $current_branch"
fi

source_ami="$SOURCE_AMI"

packer build --only=amazon-ebs \
    -var current_branch="$current_branch" \
    -var app_name="$project_name" \
    -var source_ami="$source_ami" \
    -var ami_name="$ami_name" \
    -var timestamp="$timestamp" \
    build-tools/ec2-steps/packer.json

    
