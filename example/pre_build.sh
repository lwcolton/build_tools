rm -rf requirements_dir
mkdir requirements_dir

# Requires replacing colon with slash in ssh url
mkdir requirements_dir/app_core
git archive --format=tar \
    --remote=ssh://git@git-server/group/app_core.git master \
    | tar -x -C requirements_dir/app_core
