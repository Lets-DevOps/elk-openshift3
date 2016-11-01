# elasticsearch S2I image

This is the elasticsearch S2I image:
To use it, install [S2I](https://github.com/openshift/source-to-image).

## Build the Docker s2i enabled builder image
````
make
````
## Sample invocation
````
s2i build https://github.com/TheRemoteLab/elk-openshift3 --context-dir=elasticsearch/test/test-app elasticsearch <application image>
````

You can then run the resulting image via:
````
docker run <application image>
````
