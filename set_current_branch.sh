function set_current_branch() {
    if [ -z "$BUILDKITE_BRANCH" ]; then
        current_branch=`git rev-parse --abbrev-ref HEAD`
    else
        current_branch="$BUILDKITE_BRANCH"
    fi
}

