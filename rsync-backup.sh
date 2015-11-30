#!/bin/bash -x
#
##############################################################################
#
# FILE:  rsync-backup.sh
# DESC:  Synchronizes one directory to a remote server over SSH 
#
# NAME:  Lyndell Rottmann
# EMAIL: 
#
# USAGE;
#
#        Just edit and run
#        
#
# EDIT:
#        Replace the sample data for the first four parameters
#        
#          SOURCE          user@servername:path
#                  Example:
#                      SOURCE="user@example.com:public_html"
#        
#          DESTINATION     Directory to save the backups
#                  Example:
#                      DESTINATION="/Users/backup/example.com"
#        
#        No password required, because SSH will authentic with keys.
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

T="-n"; # dry run, test mode ON
T="";   # dry run, test mode OFF

SOURCE="lyndell@vps.Lyndell.NET:."
DESTINATION="backup"

LOGFILE=`date +%s`.log
rsync -avvi $T --log-file=$LOGFILE --delete  $SOURCE $DESTINATION
# -i, --itemize-changes       output a change-summary for all updates
#     --log-file=FILE         log what we're doing to the specified FILE
#     -v, --verbose               increase verbosity
#     -a, --archive               archive mode; same as -rlptgoD (no -H)


# compress that log
bzip2 -v  $LOGFILE

