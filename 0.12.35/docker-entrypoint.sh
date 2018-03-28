#!/bin/sh

if ! find -L /opt/factorio/ -iname \*.zip -mindepth 1 -print | grep -q .; then
  /opt/factorio/bin/x64/factorio \
    --create _autosave1.zip
fi

exec /opt/factorio/bin/x64/factorio \
    --port 34197 \
    --disallow-commands \
    --start-server _autosave1.zip
