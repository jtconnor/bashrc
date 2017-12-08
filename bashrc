# Adapted from https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt
get_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}
export -f get_git_branch

get_aws_profile() {
  if [ ! -z "$AWS_PROFILE" ]; then
    echo " AWS_PROFILE=$AWS_PROFILE"
  fi
}
export -f get_aws_profile

# Make command line prompt put details on previous line.
export PS1="# \t \w\$(get_git_branch)\$(get_aws_profile)\n$ "

# Make xmllint use 1-space indent.
export XMLLINT_INDENT=" "
