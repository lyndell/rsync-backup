#!/bin/bash -x
#
##############################################################################
#
# FILE:  rsync-backup.sh
# DESC:  Synchronizes one directory to a remote server over SSH 
#
# NAME:  Lyndell Rottmann
# EMAIL: lrottann@softlayer.com
#
# INSTALLATION:
#
#        Configure SSH keys
#        
#        
#        
#        
#        Save the file
#        edit
#        
#        configure in crontab
#        
#        
#        
#        
#        
#
# EDIT:
#        Replace the sample data for the first four parameters
#        
#          SRCDIR     Directory to be backed-up.
#          USER       username for logging into the remote server.
#          HOST       hostname (domain) of server to save the backups on.
#          DSTDIR     Where to save the backups on the remove server.
#        
#        No password required, because SSH will authentic with keys.
#        
#        
#        
#        
# WARNING:
#        
#        The delete switch is used on the rsync command to synchronize
#        deletions.  If the folder is deleted, the backup will be deleted
#        as well!
#        
#
##############################################################################

# import settings
# TODO; test for parameter; required
# TODO; test for directories listed in DIR parms
source $1
SRC="${USER}@${HOST}:${SRCDIR}"
# $DSTDIR is set in conf file

# use default identy, ssh key, don't need to pass parms to SSH
rsync $opts -i --log-file=$LOGFILE --delete -avv $BWLIMIT $SRC $DSTDIR
# -i, --itemize-changes       output a change-summary for all updates
#     --log-file=FILE         log what we're doing to the specified FILE
#     -v, --verbose               increase verbosity
#     -a, --archive               archive mode; same as -rlptgoD (no -H)
#     -r, --recursive             recurse into directories
#     -t, --times                 preserve times



bzip2 -v  $LOGFILE

