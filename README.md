#Script for lazy people - connection to C3SL#
(se você é preguiçoso o suficiente para não ler em inglês, desça a rolagem
até encontrar a versão em português.)


I like shortening bash commands. Why would it be any different on ssh?

I wrote this script to specifically connect to C3SL (a server system at UFPR).
It can be easily adapted to any other ends. And, of course, you will find
better stuff out there. But this one? I did it. Ergo, I use it.

##Using##

You should execute the script with source. What I did: I created a scripts
folder on my Home and added on my .bashrc a loop to execute every script
from that folder.

If you are a C3SL user, you can simply change the USER variable to fit your
login and home folder. (note that you should verify if your home stands inside
/home/bcc).

Once the script is sourced, you should have the con function available on
bash. To connect to macalan server, try:

```bash
    con macalan
```

You might experience better results (I mean, laziness friendly interface) if
you use a rsa key to connect.

If you follow the above command with the mount string, instead of opening
an ssh session, the script will attempt to mount the home folder on a folder
with the same name inside your home (through sshfs). To umount mounted
folders, use con umount. To check for open SFTP sessions that might indicate
a sshfs mounted folder, use con status.

Note that umount and status are implemented to look for SFTP connections with
the host. That could be a problem if you run the script along with any other
SFTP session.

In that case, you can manually umount the folder by using fusermount -u [folder]
command.

Use it, change it as you please. Only be polite and don't sell it.

#Script do preguiçoso para conexão com a C3SL (README em português)#

Gosto de encurtar comandos. Por que com o ssh seria diferente?

Fiz esse script para conectar especificamente aos servidores de uso geral da C3SL.
Ele pode facilmente ser adaptado para outros fins. E, é claro, você encontrará algo
melhor por aí, mas pra mim, esse tem o sabor de "eu que fiz".

##Modo de uso##

Tenho, em minha pasta pessoal, uma pasta scripts. Dentro dessa pasta, coloco os poucos
scripts mais complicados que escrevo. O motivo: é fácil fazer backup, e eu não preciso
fazer grandes alterações no .bashrc quando migro de uma máquina (ou instalação) para
outra.

O arquivo importante é o ssh_known_points.sh. Nele, edite os seus dados de usuário e
o diretório onde o sshfs pode montar sua pasta pessoal. O usuário padrão ali é rce16,
que é o meu - claro. Em versões futuras, devo resolver isso em um arquivo de configurações,
se a paciência permitir.

Para tornar o comando con disponível, basta executar o script com um source:

```bash
    source ~/scripts/ssh_known_points.sh
```

Para conectar à C3SL via ssh, utilize o comando con seguido do servidor desejado.

```bash
    con macalan
```

Para montar sua pasta pessoal via sshfs, use o comando acima seguido de um mount.
con seguido apenas de "status" exibirá conexões sftp ativas, e con seguido de "umount"
encerrará todas as conexões sshfs ativas.

Altere e use como quiser. Sugestões são bem vindas.
