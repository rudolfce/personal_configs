con ()
{
    if [[ $1 =~ ^(macalan|bowmore|caporal|priorat|talisker|cohiba)$ ]]; then
        if [[ $2 =~ ^(mount)$ ]]; then
            sshfs rce16@${1}.c3sl.ufpr.br:/home/bcc/rce16 ~/rce16
        else
            ssh rce16@${1}.c3sl.ufpr.br
        fi
    elif [[ $1 == status ]]; then
        SFTP_KNOWN_STATUS=$(ps aux | grep -i sftp | grep -v grep | awk '{ print $16 }')
        if [ ! -z $SFTP_KNOWN_STATUS ]; then
            echo "Conexoes ativas:"
            echo $SFTP_KNOWN_STATUS
        else
            echo "Nenhuma conexao ativa"
        fi
    elif [[ $1 == umount ]]; then
        SFTP_KNOWN_STATUS=$(ps aux | grep -i sftp | grep -v grep | awk '{ print $16 }')
        if [ ! -z $SFTP_KNOWN_STATUS ]; then
            fusermount -u $(mount | grep $SFTP_KNOWN_STATUS | awk '{ print $3 }')
        else
            echo "Nenhum mount ativo"
        fi
    else
        cat ~/scripts/ssh_use.txt
    fi
}
