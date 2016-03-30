#Script do preguiçoso para conexão com a C3SL#

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
