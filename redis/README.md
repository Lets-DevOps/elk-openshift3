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
docker run <application image>
```
