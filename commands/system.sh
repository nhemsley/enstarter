
enstarter_parse_repository_user_name_branch() {
  REPO=$1
  REPO_DETAILS=$(echo $REPO | sed 's/\// /' | sed 's/#/ /')
  echo $REPO_DETAILS
}


for i in "$@"
do
  shift
  case $i in
    create)
      #branch out to our system to a new branch
      [ -z "$@" ] && echo 'Please pass the system name in'
      BRANCH=$1
      GIT_PROVIDER=$(cat $ENSTARTER_CONFIG_DIR/git-provider)
      REPOSITORY=$(cat $ENSTARTER_CONFIG_DIR/repository)

      read -r repo_user repo_name repo_branch <<< $(enstarter_parse_repository_user_name_branch $REPOSITORY)
      echo $BRANCH $repo_user $repo_name $repo_branch
      echo "$repo_user/$repo_name#$BRANCH" > $ENSTARTER_CONFIG_DIR/repository
      git -C $ENSTARTER_ORIGIN checkout -b $BRANCH
    ;;
    save)
      git -C $ENSTARTER_ORIGIN add config
      git -C $ENSTARTER_ORIGIN commit 'Enstarter system save'
      read -r repo_user repo_name repo_branch <<< $(enstarter_parse_repository_user_name_branch $REPOSITORY)
    ;;
    *)
    publish)
      read -r repo_user repo_name repo_branch <<< $(enstarter_parse_repository_user_name_branch $REPOSITORY)
      git -C $ENSTARTER_ORIGIN push origin $repo_branch

    ;;
    *)
            # unknown option
    ;;
  esac
done
