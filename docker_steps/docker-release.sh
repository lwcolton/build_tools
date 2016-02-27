set -e
. build-tools/set_current_branch.sh
set_current_branch
docker_login_cmd=`aws ecr get-login --region us-east-1`
if [ -z $ECR_REPO ]; then
    echo Need ECR_REPO variable
    exit 1
fi
if [ -z $LOCAL_REPO ]; then
    echo Need LOCAL_REPO variable
    exit 1
fi
ecr_image_name="$ECR_REPO:$current_branch"
$docker_login_cmd
docker tag -f "$LOCAL_REPO:$current_branch" "$ecr_image_name"
docker push "$ecr_image_name"
