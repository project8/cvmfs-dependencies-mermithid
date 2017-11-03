# Project 8 CVMFS Python Dependencies


## Installing on the actual CVMFS system

1. Clone the `cmvfs-dependencies-py` repo
1. Make sure the dependency build version in `run-cvmfs-install.sh` (variable `P8DEPPYBUILD`) is set correctly
1. Execute `run-cvmfs-install.sh`

## Using the Docker mockup of the CVMFS system


## Updating a dependency

1. Update the the version in install.sh
1. Update the build date in Dockerfile (environment variable `P8DEPPYBUILD`)
1. Test the build locally
1. If the build works, push the changes to the Ladybug repo
1. Trigger a rebuild of the image on Docker Hub
1. If the rebuild works, and the rebuild of anything that depends on this image works, notify the DIRAC team of the changes that need to be pushed to CVMFS
