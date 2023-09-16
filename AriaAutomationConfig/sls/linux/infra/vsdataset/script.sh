#!/bin/bash
# Re-org this to scripts folder? What about Windows?
vmtoolsd --cmd 'datasets-get-entry {"keys": ["AppID"], "dataset":"salt-ds"}' | jq -r '.entries[].AppID'