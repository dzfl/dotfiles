# vim: ts=4 sw=4 sts=4 et ff=unix fenc=utf-8

# screen
[ ${STY} ] || screen -rx || screen -D -RR -U

### path
FLEX_HOME='/usr/local/lib/flex'
PATH="$PATH:/usr/sbin:$HOME/bin:$FLEX_HOME/bin:$FLEX_HOME/player/debug"
export PATH

export RUBYOPT=rubygems

export GISTY_DIR="$HOME/gist"

### lang
export LANG=ja_JP.UTF-8
export EDITOR=vim
LISRMAX=0
export LSCOLORS=bx
export PAGER="/usr/bin/lv -c"

#補完リストが多いときに尋ねる数
# -1 : 尋ねない
#  0 : ウィンドウから溢れるときは尋ねる
LISTMAX=0
export LISTMAX

fpath=($HOME/.zsh/zfunc $fpath)

autoload -U compinit
compinit -u
autoload predict-on
predict-on

# zshエディタ ($ zed)
autoload zed

# Beep音を鳴らさない
setopt nolistbeep
setopt no_beep

# 直前のコマンドと同一ならば登録しない
setopt hist_ignore_dups

# 登録済コマンド行は古い方を削除
setopt hist_ignore_all_dups

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 履歴をインクリメンタルに追加
setopt inc_append_history

# 余分な空白は詰めて登録(空白数違い登録を防ぐ)
setopt hist_reduce_blanks

# 履歴を追加(毎回HISTFILEを作るのではなく)
setopt append_history

# 補完候補リストを詰めて表示
setopt list_packed

# 補完候補リストの日本語を適正表示
setopt print_eight_bit

# logout時にバックグラウンドジョブを kill しない
setopt nohup
setopt nocheckjobs

# 第1引数がディレクトリだと cd を補完
setopt auto_cd

# cd -<Tab>で今までに移動したディレクトリを表示
setopt auto_pushd
setopt pushd_ignore_dups

# スペルミス補完
setopt correct

# 補完候補一覧を識別マーク表示(ls -F のそれ)
setopt list_types

# ^Iで補完候補を表示（曖昧補完）
setopt auto_list

# = 以降でも補完できるようにする( --prefix=/usr 等の場合)
setopt magic_equal_subst

# カレントディレクトリ中にサブディレクトリが
# 見付からなかった場合に cd が検索する
# ディレクトリのリスト
cdpath=($HOME)

# PROMPTに彩色
setopt PROMPT_SUBST

# zmv
autoload -Uz zmv
#alias zmv='noglob zmv -W'

# vcs on prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats ' %s:%b'
zstyle ':vcs_info:*' actionformats ' %s:%b\!%a'
function prompt_misc() {
    # vcs on prompt
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"

    newPWD=${PWD/${HOME}/\~}

    #hostnam=${HOST/\.*/} # %m
    #usernam=${USER}
    #newPWD=${PWD/${HOME}/\~}
    #hist=${HISTCMD}
    #promptstr="(${usernam}@${hostnam})-<${hist}>-(${newPWD})"
    #fillsize=$(( ${COLUMNS} - ${#promptstr} ))
    #if [ $fillsize -ge 0 ]
    #then
    #    fill=${(l.${fillsize}.. .)}
    #else
    #    fill=""
    #    offset=$(( (${fillsize}*(-1)) + 4 ))
    #    newPWD="..."${newPWD[${offset},-1]}
    #fi
}
precmd_functions=($precmd_functions prompt_misc)


local C_NC=$'%{\e[38;5;252m%}'
local C_BLACK=$'%{\e[38;5;240m%}'
local C_L_WHITE=$'%{\e[38;5;255m%}'
local C_BLUE=$'%{\e[38;5;45m%}'
local C_GREEN=$'%{\e[38;5;30m%}'
local C_CYAN=$'%{\e[38;5;24m%}'
local C_RED=$'%{\e[38;5;174m%}'
local C_PURPLE=$'%{\e[38;5;177m%}'
local C_YELLOW=$'%{\e[38;5;229m%}'
local C_GRAY=$'%{\e[38;5;247m%}'
local C_NAVY=$'%{\e[38;5;103m%}'
local C_PINK=$'%{\e[38;5;161m%}'


PROMPT=$'\n'\
$C_NC"["\
$C_WHITE"\${USER}"$C_BLACK"@"$C_GRAY"\${HOST}"\
$C_NC"] "\
$C_CYAN"\${newPWD}"\
"%1(v|%f$C_GREEN%1v%f|)"\
$'\n'\
$C_CYAN"%(!.#.$)"%b\
$'%{\e[m%} '

### history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt share_history

### alias
# 補完される前にオリジナルのコマンドまで展開してチェックする
setopt complete_aliases

alias cdh="cd ~"
alias less="/usr/bin/less -r"
alias ls="/bin/ls -F --color"
alias ll="ls -alh"
alias lv="lv -c"
alias df="df -hT"
alias du="du -sh"
alias tgx="tar xzvf"
alias tgc="tar czvf"
alias txx="tar Jxvf"
alias txc="tar Jcvf"
alias -g G='| grep '
alias -g L='| lv'
alias apacherestart='sudo apache2ctl configtest && apache2ctl gracefula'
alias vim="vim -X"


# 補完時に大小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


### limit
limit coredumpsize 0			# コアファイルを吐かないようにする

# 単語単位のバックスペース(C-w)でパスの区切り文字を含めない
# default) *?_-.[]~=/&;!#$%^(){}<>
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# コンソールキーバインドはEmacsのが楽
bindkey -e
# http://subtech.g.hatena.ne.jp/secondlife/20091020/1256008337
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward


# 設定再読み込み
function reload() {
    source ${HOME}/.zshrc
}

# 256色確認
function pcolor() {
    for ((f = 0; f < 255; f++)); do
        printf "\e[38;5;%dm %3d*■\e[m" $f $f
        if [[ $f%8 -eq 7 ]] then
            printf "\n"
        fi
        done
    echo
}

# http://subtech.g.hatena.ne.jp/secondlife/20080604/1212562182
# e.g) cdf .vim
function cdf() {
    local -a tmpparent; tmpparent=""
    local -a filename; filename="${1}"
    local -a file
    local -a num; num=0
    while [ $num -le 10 ]; do
        tmpparent="${tmpparent}../"
        file="${tmpparent}${filename}"
        if [ -f "${file}" ] || [ -d "${file}" ]; then
            cd ${tmpparent}
            break
        fi
        num=$(($num + 1))
    done
}

if type keychain &> /dev/null; then
    keychain --nogui ${HOME}/.ssh/id_rsa
    source ${HOME}/.keychain/$(hostname)-sh
fi

function last_command_for_screen_title() {
    [ ${STY} ] && echo -ne "\ek${1%% *}\e\\"
    #if [ "$TERM" = "screen-bce" ]; then
    #    echo -ne "\ek${1%% *}\e\\"
    #fi
}
preexec_functions=($preexec_functions last_command_for_screen_title)

# for outputz.com
#    if [ ${1} ]; then
#        key=`ruby -rubygems -e 'require "pit";print Pit.get("outputz.com")["key"]'`
#        curl -s http://outputz.com/api/post -F key=${key} -F uri=http://zsh.localhost/ -F size=${#1} >/dev/null
#    fi


