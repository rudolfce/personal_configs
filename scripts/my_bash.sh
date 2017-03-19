if [ -n "$SSH_CLIENT" ]; then text="(ssh) "
fi
PS1='${debian_chroot:+($debian_chroot)}[$?] \u@\[\e[1;34m\]\h\[\e[m\] [\w]\n${text}\$ '
