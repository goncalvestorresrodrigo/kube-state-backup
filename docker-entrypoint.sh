#!/bin/bash -e

source /functions.sh

#
GLOBALRESOURCES=${GLOBALRESOURCES:-"storageclasses"}
RESOURCETYPES=${RESOURCETYPES:-"svc,ingress,configmap,secrets,ds,rc,deployment,statefulset,job,cronjob,serviceaccount,thirdpartyresource,networkpolicy,storageclass"}
TARFILENAME="$(date +%FT%T).tar.gz"

# cleanp backup folder
rm -f /backup/*

# dump state
dump_state

# tar backup assets
tar_files

# upload to cloud storage
upload_s3
