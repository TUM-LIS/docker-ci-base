FROM ubuntu:16.04

LABEL maintainer="Philipp Wagner <philipp.wagner@tum.de>"
LABEL description="Base image for CI builds at TUM LIS with GitLab Runner"


# install common dependencies
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y git-core libtcl8.5 curl dc gosu sudo

# use bash as default shell
RUN ln -sf /bin/bash /bin/sh

# add service account user (UID/GID to be replaced)
RUN groupadd sa \
    && useradd --create-home -g sa sa \
    && usermod -p '*' sa \
    && passwd -u sa

COPY start.sh /start.sh
COPY sudoconf /etc/sudoers.d/sa
COPY env_modules /bashenv.sh


ENTRYPOINT [ "/start.sh" ]

