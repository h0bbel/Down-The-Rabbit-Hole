#!/bin/bash
# Use vmtoolsd to read dataset from VM. HArdcoded to read salt-ds / AppID value

vmtoolsd --cmd 'datasets-get-entry {"keys": ["AppID"], "dataset":"salt-ds"}' | jq -r '.entries[].AppID'