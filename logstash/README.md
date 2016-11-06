
# Logstash S2I Builder Image

This is the Logstash S2I Builder image:
To use it, install [S2I](https://github.com/openshift/source-to-image).

## Clone the repository and checkout to dev branch
````
git clone https://github.com/TheRemoteLab/elk-openshift3
git checkout dev
````


## Build the Docker s2i enabled builder image

````
make
````

## Sample invocation
```sh
s2i build -e REDIS_SERVICE_NAME=<>, REDIS_PASSWORD=<>, ES_SERVICE_NAME=<>, ES_PASSWORD=<> https://github.com/TheRemoteLab/elk-openshift3#dev --context-dir=logstash/test/test-app logstash <application image>
```
The above mentioned environment variables are needed in order to communicate securely with Redis and Elasticsearch. These will be resolved in the logstash.conf file before instantiating the runtime container.

- Plugins can be installed as part of the build process by placing a `plugins.txt` file in the root of the source code location (in the above example, it is in logstash/test/test-app folder). Each plugin must be in a new line with an empty line at the end of the file. Place just the plugin-name part of the command:

```sh
${LOGSTASH_HOME}/bin/plugin install <plugin-name>
```

You can then run the resulting image via:
```sh
docker run <application image>
```
