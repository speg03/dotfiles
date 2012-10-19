# -*- coding: utf-8; mode: shell-script; -*-

if [ $TERM != 'screen' ] ; then
    screen -xR
fi

bindkey -e
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey -s '^jd' "screen -xR\n"

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

autoload -U colors
colors

autoload -U compinit
compinit

HISTFILE="$HOME/.zhistory"
HISTSIZE=10000
SAVEHIST=10000

alias ls='ls --color=auto'
alias ll='ls -al'
alias grep='grep --color=auto -n'
alias em='emacsclient -t'
alias kill-emacs="emacsclient -e '(kill-emacs)'"

alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'

alias -g G='| grep'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'

unsetopt promptcr
setopt prompt_subst
PROMPT=$'%{$fg[green]%}%n@%m%{$reset_color%} %{$fg[yellow]%}[%~]%{$reset_color%} \n%(!.#.$) '

setopt append_history auto_list auto_menu auto_param_keys auto_param_slash auto_resume no_beep brace_ccl correct equals extended_glob no_flow_control hist_ignore_dups hist_ignore_space hist_verify no_hup ignore_eof interactive_comments list_types long_list_jobs magic_equal_subst mark_dirs multios numeric_glob_sort print_eightbit print_exit_value pushd_ignore_dups short_loops share_history hist_no_store pushd_silent

if [ "$TERM" = "screen" ]; then
    chpwd () { echo -n "_`dirs`\\" }
    preexec() {
        # see [zsh-workers:13180]
        # http://www.zsh.org/mla/workers/2000/msg03993.html
        emulate -L zsh
        local -a cmd; cmd=(${(z)2})
        case $cmd[1] in
            fg)
                if (( $#cmd == 1 )); then
                    cmd=(builtin jobs -l %+)
                else
                    cmd=(builtin jobs -l $cmd[2])
                fi
                ;;
            %*) 
                cmd=(builtin jobs -l $cmd[1])
                ;;
            cd|ssh)
                if (( $#cmd >= 2)); then
                    cmd[1]=$cmd[2]
                fi
                ;&
            *)
                echo -n "k$cmd[1]:t\\"
                return
                ;;
        esac

        local -A jt; jt=(${(kv)jobtexts})

        $cmd >>(read num rest
            cmd=(${(z)${(e):-\$jt$num}})
            echo -n "k$cmd[1]:t\\") 2>/dev/null
    }
    chpwd
fi
