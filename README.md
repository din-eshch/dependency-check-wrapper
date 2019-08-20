# dependency-check-container-wrapper
Dependency Check Container Wrapper

New image built from Dependency Check Container Wrapper Base image every night with CVE updates. 

### Config:
Common config options are moved to config.ini for low friction. Changes to log file path, report name, when to break the build can be made in the config file. This will override settings inherited from the ODC base image.

### Usage:
```
docker run --rm \
    --volume "$PWD/testdata":/src \
    --volume "$REPORT_DIRECTORY":/report \
    dependency-check-wrapper \
    --project "$APP_NAME" \
    --suppression "$SUPPRESSION_FILE"
 ```
### Jenkins Job Info:

Any push to this repository will automatically trigger a build in jenkins. This build will push the newly built image into artifactory and overwrite the previous one. If no changes, the build will trigger every weekday at 11:30 AM PT.

Build alerts will be sent to this slack channel : #dc
