# s2i-builder OSv3 template

s2i-builder template is a parameterized template that helps build an s2i enabled builder-image/runtime on Openshift v3 using the buildConfig and Imagestream resources. The template takes the required parameters as input and starts a build form the provided repository using the `Docker` build strategy. The resultant image can be accessed from the Imagestream of the current project namespace.

## parameters
- `BUILDER_IMAGE_NAME` - Expected name of the builder image
- `BUILDER_IMAGE_TAG` - Expected tag of the builder image
- `GIT_URI` - Git source URI for builder
- `GIT_REF` - Git branch/tag reference
- `CONTEXT_DIR` - Git context directory
- `GIT_SOURCE_SECRET` - Git scm [secret](https://docs.openshift.com/enterprise/3.1/dev_guide/builds.html#source-code) that is already created in osv3

## Use the template

````
$ oc login
$ oc use <project>
$ oc create -f https://github.com/TheRemoteLab/elk-openshift3/blob/dev/templates/s2i-builder/s2i-builder.json
````
Once the template has been registered, you can access it in the *Browse Catalog* section of the web console after navigating to your project and clicking *add to project*. After providing the input parameters, click on *create*. This will trigger a build which finally creates and pushes the builder-image to the respective imagestream.

This builder image can then be used just like any other inbuilt runtime on osv3 to create application images that get deployed.
