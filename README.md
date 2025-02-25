## Pihole

Run pihole on a separate machine to avoid DNS resolution problems when creating and destroying docker containers

## Homeserver

Setup is done using docker compose.

Run
```
docker compose config
```
to verify the config.

##

All data is saved to `../data/<service>`. Back it up!


### upgrade immich 

Follow the instructions [here](https://immich.app/docs/install/docker-compose/#upgrading). In case a new compose file is needed, replace it with the `compose/immich/immich.yml` compare diff before deploying.