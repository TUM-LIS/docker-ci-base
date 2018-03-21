# Docker Image for CI builds at TUM LIS

Use this docker image as base for Continuous Integration builds with GitLab Runner on TUM LIS infrastructure.
It is designed to be able to access shared infrastructure such as tools on kerberized NFS shares loaded using Environment Modules.

## User Mapping
All jobs in this container are executed as user "sa".
This user can be mapped to an arbitrary user on the host by setting the UID/GID of the sa user in the container to the UID/GID of the desired user on the host.
The UID/GID of the sa user is set at container runtime to the values passed in the `SA_UID` and `SA_GID` environment variables (e.g. `docker run --env SA_UID=2000 --env SA_GID=3000`).

## Root Permissions
Through sudo the `sa` user has full root permissions inside the container (e.g. to install packages using `apt-get`).

## Environment Modules
The `module load` command and friends are available inside the container like on a regular machine if the environment variable `MODULES_INIT_BASH` script is set to the bash init script of modules, e.g. `MODULES_INIT_BASH=/some/path/Modules/3.2.8/init/bash`.
This script is then sourced when running any command inside the container.

