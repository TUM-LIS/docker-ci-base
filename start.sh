#!/bin/bash

set_serviceaccount_ids() {
    SA_UID=${SA_UID:-1000}
    SA_GID=${SA_GID:-1000}
    groupmod -o -g "$SA_GID" sa >/dev/null 2>&1
    usermod -o -u "$SA_UID" sa >/dev/null 2>&1
}

set_serviceaccount_ids

# sourced by bash on startup
export BASH_ENV=/bashenv.sh

exec gosu sa:sa /bin/bash -c "$@"

