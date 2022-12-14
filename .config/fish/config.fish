set fish_greeting ""

set -gx TERM alacritty
set -gx LANG "pt_BR.utf-8"

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim

set -gx EDITOR nvim
set -gx UID (id -u)
set -gx SXHKD_SHELL '/usr/bin/sh'

set -Ux fish_user_paths $HOME/.rbenv/bin $fish_user_paths
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH /usr/local/go/bin $PATH

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end


status --is-interactive; and rbenv init - fish | source
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

function exclusivities

    set -f base_url = ""

    switch $argv[1]
        case staging
            set -f base_url "https://staging.orulo.com.br"
        case prod
            set -f base_url "https://www.orulo.com.br"
    end

    docker run --rm -e ORULO_BASE_URL=$base_url -e ORULO_WRITE_EXCLUSIVITIES=$argv[2] -v $(pwd):/opt/app -w /opt/app php script/run_import.sh $argv[3]_exclusivities $argv[4]
end

# start fuzzy finder frontend to greenclip
function fzf-clipboard
    echo -n "$(greenclip print | fzf -e -i)" | xclip -selection clipboard ;
end

# greenclip configuration settings
function cfg-greenclip
    killall greenclip ; $EDITOR ~/.config/greenclip.cfg && nohup greenclip daemon > /dev/null 2>&1 &
end

# greenclip reload
function rld-greenclip
    killall greenclip ; nohup greenclip daemon > /dev/null 2>&1 &
end

# greenclip clear history
function derez-greenclip
    killall greenclip ; rm ~/.cache/greenclip.history && nohup greenclip daemon > /dev/null 2>&1 &
end

set -gx RUBY_CONFIGURE_OPTS --with-openssl-dir=$(brew --prefix openssl@1.1)
alias config='/usr/bin/git --git-dir=/home/rlima/.cfg/ --work-tree=/home/rlima'
