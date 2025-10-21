Feature: Availability and Recovery: The backup storage location will have write and read configurations for the System (Bareos) and read-only rights for system-level admins.
CS:
FileSet {
    Name = "redcap-c9.ctsi.utah.edu"
    Description = "Backup all regular filesystems, determined by filesystem type."
    Include {
        Options {
            Signature = MD5 # calculate md5 checksum per file
            compression = LZO
            One FS = Yes # No changes into other filessytems
            FS Type = ext2 # filesystems of given types will be backed up
            FS Type = ext3 # others will be ignored
            FS Type = ext4
            FS Type = btrfs
            FS Type = reiserfs
            FS Type = jfs
            FS Type = xfs
            FS Type = zfs
        }
        File = /
    }
    # Things that usually have to be excluded
    # You have to exclude /var/lib/bareos/storage
    # on your bareos server
    Exclude {
        File = /.fsck
        File = /.journal
        File = /dev
        File = /sys
        File = /tmp
        File = /proc
        File = /scratch
        File = /var/lib/bareos
        File = /var/lib/bareos/storage
        File = /uufs/*/common
    }
}

Mysqldump Database back up location: CHPC HIPAA Filesystem NFS
mounted to:
"/uufs/chpc.utah.edu/common/HIPAA/proj_redcap/prod/backup/daily/"
Permissions are set to drwxrws---+ 6 root proj_redcap
Only REDCap administrators and CHPC staff have permissions to write to this directory
Sub directories are used to store dev/test/prod for daily database dumps

  As a REDCap end user
  I want to see that the backup storage location will have write and read configurations for the System (Bareos) and read-only rights for system-level admins.

  #This feature test is REDUNDANT and can be viewed in Feature: D.100.1.2000 - Access permissions
  #Scenario: D.100.1.2000.100 - Access permissions for backup storage location
  #Scenario: D.100.1.2000.200 - Access permissions for REDCap system storage location