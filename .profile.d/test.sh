export_env_dir() {
  env_dir=$1
  postgres="postgres://"
  postgresql="postgresql://"
  acceptlist_regex=${2:-''}
  denylist_regex=${3:-'^(PATH|GIT_DIR|CPATH|CPPATH|LD_PRELOAD|LIBRARY_PATH)$'}
  for e in $(ls $env_dir); do
    echo "$e" | grep -E "$acceptlist_regex" | grep -qvE "$denylist_regex" 
    :
  done
}

export_env_dir
