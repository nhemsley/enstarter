
enstarter_parse_repository_user_name_branch() {
  REPO=$1
  REPO_DETAILS=$(echo $REPO | sed 's/\// /' | sed 's/#/ /')
  echo $REPO_DETAILS
}

#params are provicer_url, $repo_user, $repo_name
enstarter_build_git_url() {
  echo "git@$1:$2/$3.git"
}
