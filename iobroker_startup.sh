#!/bin/sh

cd /opt/iobroker

if [ -f .install_host ]; then
        echo $(hostname) > .install_host && ./iobroker host $(cat .install_host)
        iobroker del admin.0 && iobroker del discovery.0
        iobroker add admin && iobroker add discovery
        rm .install_host
fi

if [ ! -f .skip_restore ]; then
    for file in $(ls -r backups/*_backupiobroker* 2>/dev/null);
    do
        echo restore latest $file as first bootup.
        ./iobroker restore $file
        touch .skip_restore
        break
    done
fi

node node_modules/iobroker.js-controller/controller.js >/opt/scripts/docker_iobroker_log.txt 2>&1
