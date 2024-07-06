# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/lib/node_modules/tree-sitter:$PATH"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="fino"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

#path to XAMPP
export PATH="/opt/lampp/bin:$PATH"
export PATH="/home/:$PATH"
#composer
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH=$PATH:$GOPATH/bin


# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
#alias zshconfig="mate ~/.zshrc"
#alias ohmyzsh="mate ~/.oh-my-zsh"
   alias "ls -l"="lsd -l"
   alias  ls="lsd"
   alias neo="~/fm6000/fm6000"
   alias clear="printf '\033[2J\033[3J\033[1;1H'";
   alias pa="php artisan"
   alias tas="tmux attach-session -t"
   alias tk="tmux kill-session -t"
   alias tks="tmux kill-server"
   alias tswap="tmux swap-window -t"
   alias sudovim="sudo -E nvim"
   alias sstatus="systemctl status"
   alias srestart="sudo systemctl restart"
   alias sstart="sudo systemctl start"
   alias senable="sudo systemctl enable"
   alias sdisable="sudo systemctl disable"
   alias sreload="sudo systemctl reload"
   alias sstop="sudo systemctl stop"
   alias password="~/koneksi/password2/password"
   alias resurrect="~/resurrect.sh"
   alias quote="~/koneksi/quote/support.sh"
   alias tugas="~/koneksi/tugas/tugas.sh"
   alias formatSave="~/.config/nvim/formatOnSave.sh"

# ~/.zshrc

export PATH="$HOME/.cargo/bin:$PATH"

eval "$(starship init zsh)"

# ~/koneksi/quote/support.sh

# ls -d */ menampilkan folder saja!

# sudo ln -s /etc/nginx/sites-available/myweb /etc/nginx/sites-enabled/
#
alias gf=gf
source ~/go/pkg/mod/github.com/tomnomnom/gf/gf-completion.zsh

quote "off"
tugas "on"
# Set up fzf key bindings and fuzzy completion
# Inisialisasi fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
export FZF_DEFAULT_OPTS='--border=rounded --height=70% --padding=3 --marker=* --color=marker:#FFF866,prompt:#FFF866'

export FZF_CTRL_T_OPTS="--preview 'eza --icons --tree --level=1 --color=always {} | head -200'"
export FZF_ALT_C_OPTS="--preview 'eza --icons --tree --level=1 --color=always {} | head -200'"

