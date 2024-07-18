alias mktempdir='mktemp -d'
alias cdmktempdir='cd `mktemp -d`'

if (( $+commands[apt] )); then
    alias apt='sudo apt'
fi

if (( $+commands[brew] )); then
    alias brewf='brew list --formula | xargs -P`expr $(nproc) - 1` -I{} sh -c '\''brew uses --installed {} | wc -l | xargs printf "%20s is used by %2d formulae.\n" {}'\'
fi

if (( $+commands[docker] )); then
    alias mysql-sandbox-run='docker container run --rm --name mysql -d -p3306:3306 -eMYSQL_ROOT_PASSWORD=sandbox -eMYSQL_DATABASE=sandbox -eMYSQL_USER=sandbox -eMYSQL_PASSWORD=sandbox -v$HOME/sandbox/mysql/conf.d:/etc/mysql/conf.d -v$HOME/sandbox/mysql:/root:ro mysql:8.0.34'
    alias mysql-sandbox-exec='docker container exec -it mysql mysql -usandbox -psandbox -Dsandbox'
    alias mysql-sandbox-exec-root='docker container exec -it mysql mysql -uroot -psandbox -Dsandbox'
    alias mysql-sandbox-stop='docker container stop mysql'
    alias mariadb-sandbox-run='docker container run --rm --name mariadb -d -p3306:3306 -eMYSQL_ROOT_PASSWORD=sandbox -eMYSQL_DATABASE=sandbox -eMYSQL_USER=sandbox -eMYSQL_PASSWORD=sandbox -v$HOME/sandbox/mariadb/conf.d:/etc/mysql/conf.d -v$HOME/sandbox/mariadb:/root:ro mariadb:10.6.4'
    alias mariadb-sandbox-exec='docker container exec -it mariadb mysql -usandbox -psandbox -Dsandbox'
    alias mariadb-sandbox-exec-root='docker container exec -it mariadb mysql -uroot -psandbox -Dsandbox'
    alias mariadb-sandbox-stop='docker container stop mariadb'
    alias redis-sandbox-run='docker container run --rm --name redis -d -p6379:6379 -v$HOME/sandbox/redis:/root:ro redis:7.0.5-alpine'
    alias redis-sandbox-exec='docker container exec -it redis redis-cli'
    alias redis-sandbox-stop='docker container stop redis'
fi

if [ -d "$HOME/projects" ]; then
    alias cdp='cd $HOME/projects'
fi
