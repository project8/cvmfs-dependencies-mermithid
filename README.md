# Project 8 CVMFS Python Dependencies

This repository can be used in two ways:

1. To install on the actual CVMFS system, use the `run-cvmfs-install.sh` script
1. To use the docker mockup CVMFS system, use the Dockerfile

When updating the dependencies-py build on GitHub, please make sure that both `run-cvmfs-install.sh` and `Dockerfile` get updated.  When a new official build is ready, tag it with the build name (the same as the build directory)

## Information

This repository provides the basic Python dependencies for Project 8 software installations on the CVMFS system used on the PNNL HEP cluster.

It's based on the CVMFS-dependencies image (https://hub.docker.com/r/project8/cvmfs-dependencies).

Project 8 software is installed in the `/cvmfs/hep.pnnl.gov/project8` directory.  From there, installed python packages go in the `dependencies-py` subdirectory.  For any images based on this image, their software should go in their own directories to avoid issues with directory names that change as builds are updated.  For example:

```
/cvmfs/hep.pnnl.gov/project8
   |
   +- dependencies

   |
   +- dependencies-py
   |     |
   |     +- latest --> build-2017-10-04
   |     |
   |     +- build-2017-10-04
   |           |
   |           +- bin, lib
   |           |
   |           +- get-pip.py (used to install python packages)
   |           |
   |           +- install.sh
   |           |
   |           +- python-tester.py (used for testing the python installation)
   |           |
   |           +- setup.sh
   |
   +- katydid
   |
   +- morpho
   . . .
```

## Installing on the actual CVMFS system

1. Clone the `cmvfs-dependencies-py` repo
1. Make sure the dependency build version in `run-cvmfs-install.sh` (variable `P8DEPPYBUILD`) is set correctly
1. Execute `run-cvmfs-install.sh`

## Using the Docker mockup of the CVMFS system


## Updating a dependency

1. Update the version in install.sh
1. Update the build date in Dockerfile (environment variable `P8DEPPYBUILD`)
1. Test the build locally
1. If the build works, push the changes to the Ladybug repo
1. Trigger a rebuild of the image on Docker Hub
1. If the rebuild works, and the rebuild of anything that depends on this image works, notify the DIRAC team of the changes that need to be pushed to CVMFS
