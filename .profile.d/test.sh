export_env_dir() {
  env_dir=$1
  postgres="postgres://"
  postgresql="postgresql://"
  acceptlist_regex=${2:-''}
  denylist_regex=${3:-'^(PATH|GIT_DIR|CPATH|CPPATH|LD_PRELOAD|LIBRARY_PATH)$'}
  if [ -d "$env_dir" ]; then
    for e in $(ls $env_dir); do
      echo "$e" | grep -E "$acceptlist_regex" | grep -qvE "$denylist_regex" &&
      export "$e=${$(cat $env_dir/$e)/"$postgres"/"$postgresql"}"
      :
    done
  fi
}

export_env_dir()
