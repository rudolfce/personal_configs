con ()
{
    USER=rce16
    case $1 in
    @(macalan|bowmore|caporal|priorat|talisker|cohiba))
        if [[ $2 == mount ]]; then
            sshfs $USER@${1}.c3sl.ufpr.br:/home/bcc/$USER ~/$USER
        else
            ssh $USER@${1}.c3sl.ufpr.br
        fi
        ;;
    status)
        SFTP_KNOWN_STATUS=$(ps aux | grep -i sftp | grep -v grep | awk '{ print $16 }')
        if [ ! -z $SFTP_KNOWN_STATUS ]; then
            echo "Active connections:"
            echo $SFTP_KNOWN_STATUS
        else
            echo "No active connections"
        fi
        ;;
    umount)
        SFTP_KNOWN_STATUS=$(ps aux | grep -i sftp | grep -v grep | awk '{ print $16 }')
        if [ ! -z $SFTP_KNOWN_STATUS ]; then
            fusermount -u $(mount | grep $SFTP_KNOWN_STATUS | awk '{ print $3 }')
        else
            echo "No mounts"
        fi
        ;;
    *)
        cat ~/scripts/ssh_use.txt
        ;;
    esac
}
