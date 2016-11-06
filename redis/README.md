# redis S2I image

This is the redis S2I image:
To use it, install [S2I](https://github.com/openshift/source-to-image).

## Build the Docker s2i enabled builder image
````
make
````
## Sample invocation
```sh
s2i build https://github.com/TheRemoteLab/elk-openshift3 --context-dir=redis/test/test-app redis <application image>
```
- redis configuration can be used as source-code for this build. A sample redis configuration file can be found at [redis/test/test-app/redis.conf](https://github.com/TheRemoteLab/elk-openshift3/tree/dev/redis/test/test-app/redis.conf)

You can then run the resulting image via:
```sh
docker run -e REDIS_PASSWORD=somepasswordthatisquitelong <application image>
```
- Make sure `REDIS_PASSWORD` set and is not empty. Since redis runs in protected mode by default, the redis server instance would not be usable without authentication. Passing `REDIS_PASSWORD` makes sure that authentication is configured in the redis.conf file.
