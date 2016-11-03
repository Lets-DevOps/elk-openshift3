# elasticsearch S2I image

This is the elasticsearch S2I image:
To use it, install [S2I](https://github.com/openshift/source-to-image).

## Build the Docker s2i enabled builder image
````
make
````
## Sample invocation
```sh
s2i build -e ADMIN_USERNAME=<username> -e ADMIN_PASSWORD=<password> https://github.com/TheRemoteLab/elk-openshift3 --context-dir=elasticsearch/test/test-app elasticsearch <application image>
```
- Plugins can be installed as part of the build process by placing a `plugins.txt` file in the root of the source code location (in the above example, it is elasticsearch/test/test-app in the repo). Each plugin must be in a new line with an empty line at the end of the file. Place just the plugin-name part of the command:
    ```sh
    plugin install <plugin-name>
    ```
- Pass environment variables `ADMIN_USERNAME` and `ADMIN_PASSWORD` only if `shield` and `license` are in the plugins.txt file.

You can then run the resulting image via:
```sh
docker run <application image>
```
