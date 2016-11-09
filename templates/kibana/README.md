# kibana OSv3 template

kibana template is a parameterized template that helps build a kibana instance on Openshift v3. The template takes the required parameters as input and configures various resource objects to deploy the kibana instance.

## prerequisites
- An s2i enabled kibana builder image built in openshift and tracked by an imagestream tag. Refer [here](https://github.com/TheRemoteLab/elk-openshift3/kibana) and [here](https://github.com/TheRemoteLab/elk-openshift3/templates/s2i-builder) to build it.
- Configuration file (`kibana.yml`). This would be the source code for the application. [Here](https://github.com/TheRemoteLab/elk-openshift3/kibana/test/test-app/kibana.conf) is an example.
- Plugins file (`plugins.txt`). This is an optional source file that includes the list of plugins to be installed, with each plugin in a new line. [Here](https://github.com/TheRemoteLab/elk-openshift3/kibana/test/test-app/plugins.txt) is an example.

## parameters
- `NAME` - The name assigned to all of the frontend objects defined in this template
- `MEMORY_LIMIT` - Maximum amount of memory the container can use
- `NAMESPACE` - Namespace where the ImageStream resides
- `BUILDER_IMAGE_NAME` - Name of the kibana s2i enabled builder image
- `BUILDER_IMAGE_TAG` - Tag of the kibana builder image
- `GIT_URI` - The URL of the repository with your application source code
- `GIT_REF` - Git branch/tag reference
- `CONTEXT_DIR` - Git context directory
- `GIT_SOURCE_SECRET` - Git scm [secret](https://docs.openshift.com/enterprise/3.1/dev_guide/builds.html#source-code) that is already created in osv3
- `GITHUB_WEBHOOK_SECRET` - A secret string used to configure the GitHub webhook
- `GENERIC_WEBHOOK_SECRET` - A secret string used to configure the Generic webhook
- `ES_SERVICE_NAME` - Elasticsearch Service Name on OSV3. This input will be used to create the env variable - `ELASTICSEARCH_URL`.
- `ES_USER` - Username to authenticate to Elasticsearch
- `ES_PASSWORD` - Password to authenticate to Elasticsearch

## Use the template

````
$ oc login
$ oc use <project>
$ oc create -f https://github.com/TheRemoteLab/elk-openshift3/templates/kibana/kibana.json
````
Once the template has been registered, you can access it in the *Browse Catalog* section of the web console after navigating to your project and clicking *add to project*. After providing the input parameters, click on *create*. This will trigger a build (which creates the application image from the builder image and the source code) and deployment (which creates the required pods that run the application image).
