unset IFS
postgres="postgres://"
postgresql="postgresql://"

for var in $(compgen -e); do
    export $var=${!var/"$postgres"/"$postgresql"}
done
