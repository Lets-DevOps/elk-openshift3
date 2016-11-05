
# Logstash S2I Builder Image

This is the Logstash S2I Builder image:
To use it, install [S2I](https://github.com/openshift/source-to-image).

## Build the Docker s2i enabled builder image
````
make
````
## Sample invocation
```sh
s2i build https://github.com/TheRemoteLab/elk-openshift3#dev --context-dir=logstash/contrib logstash-builder <application image>
```
- Plugins can be installed as part of the build process by placing a `plugins.txt` file in the root of the source code location (in the above example, it is in logstash/contib folder). Each plugin must be in a new line with an empty line at the end of the file. Place just the plugin-name part of the command:

    ```sh
    plugin install <plugin-name>
    ```

You can then run the resulting image via:
```sh
docker run <application image>
```
