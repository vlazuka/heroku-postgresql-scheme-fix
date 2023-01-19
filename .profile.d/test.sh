unset IFS
postgres="postgres://"
postgresql="postgresql://"

for var in $(compgen -e); do
    if [[ "${!var}" == *"$postgres"* ]]; then
        export $var=${!var/"$postgres"/"$postgresql"}
        #echo "${!var}"
    fi
done
