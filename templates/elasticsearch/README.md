# elasticsearch OSv3 template

elasticsearch template is a parameterized template that helps build an elasticsearch application on Openshift v3. The template takes the required parameters as input and configures various resource objects to deploy the elasticsearch application.

## prerequisites
- An s2i enabled elasticsearch builder image built in openshift and tracked by an imagestream tag. Refer [here](https://github.com/TheRemoteLab/elk-openshift3/tree/dev/elasticsearch) and [here](https://github.com/TheRemoteLab/elk-openshift3/tree/dev/templates/s2i-builder) to build it.
- Configuration files (`elasticsearch.yml`, `logging.yml`) in a `config/` directory. This would be the source code for the application. [Here](https://github.com/TheRemoteLab/elk-openshift3/tree/dev/elasticsearch/test/test-app) is an example.

## parameters
- `NAME` - The name assigned to all of the frontend objects defined in this template
- `MEMORY_LIMIT` - Maximum amount of memory the container can use
- `NAMESPACE` - Namespace where the ImageStream resides
- `BUILDER_IMAGE_NAME` - Name of the elasticsearch s2i enabled builder image
- `BUILDER_IMAGE_TAG` - Tag of the elasticsearch builder image
- `GIT_URI` - The URL of the repository with your application source code
- `GIT_REF` - Git branch/tag reference
- `CONTEXT_DIR` - Git context directory
- `GIT_SOURCE_SECRET` - Git scm [secret](https://docs.openshift.com/enterprise/3.1/dev_guide/builds.html#source-code) that is already created in osv3
- `GITHUB_WEBHOOK_SECRET` - A secret string used to configure the GitHub webhook
- `GENERIC_WEBHOOK_SECRET` - A secret string used to configure the Generic webhook

## Use the template

````
$ oc login
$ oc use <project>
$ oc create -f https://github.com/TheRemoteLab/elk-openshift3/blob/dev/templates/elasticsearch/elasticsearch.json
````
Once the template has been registered, you can access it in the *Browse Catalog* section of the web console after navigating to your project and clicking *add to project*. After providing the input parameters, click on *create*. This will trigger a build (which creates the application image from the builder image and the source code) and deployment (which creates the required pods that run the application image).
