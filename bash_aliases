#-*-shell-script-*-

# Mac OSX specific
#
alias aquamacs='open -a Aquamacs'
alias es_start='elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml'
alias excel='open -a /Applications/Microsoft\ Office\ 2011/Microsoft\ Excel.app '
alias open_ports='lsof -i | grep LISTEN'
alias sourcetree='open -a /Applications/SourceTree.app'
alias sublime='open -a /Applications/Sublime\ Text\ 2.app'
alias marked='open -a /Applications/Marked.app'
alias sourcetree='open -a /Applications/Sourcetree.app'

# These should work with any *nix
#
alias ack='ack --ignore-dir=coverage'
alias dss='diff --side-by-side'
alias decode64='ruby -rbase64 -e '\''print Base64.decode64(File.open(ARGV[0]){|f| f.read})'\'''
alias encode64='ruby -rbase64 -e '\''print Base64.encode64(File.open(ARGV[0]){|f| f.read})'\'''
alias git-update='git fetch --tags; git fetch origin; for i in rc master; do git co $i; git pull origin $i; done'
alias knife-ssh='knife ssh '\''role:rails3 AND chef_environment:production AND NOT role:maintenance'\'' -a name -c config/chef/knife-prod.rb'
alias mac2unix='perl -pe '\''s/\r/\n/mg'\'''
alias path='ruby -e "puts ENV[\"PATH\"].gsub(/:/, \"\n\")"'
alias pipclean="pip list | tabify | cut -f1 | egrep -v 'pip|setuptools|virtualenv|wheel|\bPackage\b|-------' | xargs pip uninstall --yes"
alias pretty_json='ruby -r json -e '\''txt = ARGF.read; h = JSON.parse(txt); puts JSON.pretty_generate(h)'\'''
alias psgrep='ps aux | grep -v grep | grep '
alias python_simple_http_server='python -m SimpleHTTPServer'
alias rspecc='rspec --profile 0 --format documentation'
alias tabify='ruby -pe '\''gsub(/ +/, "\t")'\'''

if [ -f .bash_functions ]; then
    source .bash_functions
fi

# docker aliases because I'm tired of all the typing
alias dcl='docker container list'
alias dcla='docker container list --all'
alias dil='docker image list'

# --rm auto remove container upon exit
alias drrm='docker run --rm'

# exec bash as root interactively for a docker container
dexecbash ()
{
    DOCKER_TAINER=$1
    shift
    docker exec -u root -it $DOCKER_TAINER bash
}


# redis server without persistence - https://stackoverflow.com/a/41238678
alias redis-server='redis-server --save "" --appendonly no'
