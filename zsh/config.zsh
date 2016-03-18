# Evitando duplicatas no histórico 
 setopt HIST_IGNORE_ALL_DUPS
 
# Opções para o histórico:
 setopt EXTENDED_HISTORY HIST_VERIFY HIST_REDUCE_BLANKS HIST_IGNORE_ALL_DUPS
    # Obs.: Caso queira procurar um comando específico no histórico,
    # você pode utilizar como alternativa a combinação de teclas
    # 'CTRL+R' e digitar o comando procurado.

#Visualizar os ultimos diretórios acessados.O comando para visualizar é dirs -v

DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

##Prevenir linhas duplicadas no histórico
setopt HIST_IGNORE_DUPS

##Autocomplete para aliases
setopt completealiases

##Pesquisar histórico
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward

## This reverts the +/- operators.
setopt pushdminus

# Carregando alguns módulos úteis:
    zmodload -i zsh/complete
    zmodload -i zsh/mapfile
    zmodload -i zsh/mathfunc
    zmodload -i zsh/complist
    zmodload -i zsh/curses
    zmodload -i zsh/datetime
    zmodload -i zsh/terminfo 

# Carregando o módulo zmv
    autoload -U zmv 

# Ativando auto-correção:
    setopt correct
    setopt correct_all
    export sprompt="$(print '%{\e[37m%}zsh: Corrigir para %S%r%s ? (n|y|e): %{\e[0m%}')"
 
 # Permite o uso dos curingas: *?_-.[]~=/&;!#$%^(){}<>
    setopt extended_glob

 # Ativando auto cd (não há necessidade de uso do comando cd):
    setopt auto_cd
    setopt cdable_vars
    setopt auto_pushd
    setopt pushd_ignore_dups
    setopt pushd_silent
 
 # Auto-completando com <TAB>
    setopt auto_list
    setopt auto_menu
    setopt case_glob
    setopt list_types
    setopt glob_complete
    setopt menu_complete
    setopt complete_in_word
    setopt complete_aliases
    autoload -Uz compinit promptinit
    compinit
    promptinit
    autoload  colors
    colors
 #  prompt fade  #prompt -l com esse comando vc terá mais opções do prompt troquem Adam2 por qualquer uma das disponíveis
 #  RPROMPT="%{$reset_color%}< %{$fg[blue]%}%M%{$reset_color%}:%{$fg[cyan]%}%y%{$reset_color%}:%{$fg[yellow]%}%~%{$reset_color%}"
 #  PROMPT="%{$reset_color%}%{$fg[yellow]%} %T%{$reset_color%} %{$fg[green]%}%n%{$reset_color%} > "



 # Ativando modo 'verbose':
   zstyle ':completion:*' verbose 'yes'
   zstyle ':completion:*' show-completer

# Repetição persistente
   zstyle ':completion:*' rehash true

 # Lista colorida de complementações:
   zstyle ':completion:*:default' list-colors ${(s.:.)ZLS_COLORS}

 # Menu de seleção visual:
   zstyle ':completion:*' menu select=3 _complete _i-patterns ignored_approximate
   zstyle ':completion:*' select-prompt '%S zsh: Seleção atual = %p %s'

 # Auto descrição das complementações possíveis:
   zstyle ':completion:*:options' description 'yes'
   zstyle ':completion:*:options' auto-description '%d'

# Formato das mensagens de auto-complementação:
   zstyle ':completion:*:corrections' format '%Bzsh: %d (erros: %e)%b'
   zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
   zstyle ':completion:*:warnings' format '%Bzsh: Inválido como: %d%b'

 # Listando auto-complementações em grupos:
   zstyle ':completion:*:matches' groups 'yes'
   zstyle ':completion:*' list-grouped
   zstyle ':completion:*' group-name ''
   zstyle ':completion:*:*:-command-:*' group-order commands builtins

 # Expandir o máximo que puder:
   zstyle ':completion:incremental:*' completer _complete _correct
   zstyle ':completion:*' completer _complete _correct _match _approximate
   zstyle ':completion:*:expand:*' tag-order all-expansions

 # Número de erros a aceitar durante auto-complementação:
   zstyle ':completion:*:approximate:*' max-errors 2 numeric

 # Usar '/d/s <TAB>' para expandir para '/dir/subdir':
   zstyle ':completion:*' expand 'yes'
   zstyle ':completion:*' squeeze-slashes 'yes'

 # Preservar prefixo/sufixo durante auto-complementação:
  zstyle ':completion:*' expand prefix suffix
  zstyle ':completion:*' completer _complete _prefix _match _approximate
  zstyle ':completion:*' preserve-prefix '//[^ /]##/'
  zstyle ':completion:*:match:*' original only 
  zstyle ':completion:*approximate :*' max-errors 1 numeric

 # Opção auto-cd deve ignorar o diretório corrente:
   zstyle ':completion:*:cd:*' ignore-parents parent pwd

 # Evitar entradas duplicadas para os comandos abaixo:
   zstyle ':completion:*:rm:*' ignore-line 'yes'
   zstyle ':completion:*:cp:*' ignore-line 'yes'
   zstyle ':completion:*:mv:*' ignore-line 'yes'

 # Auto-complementação case-sensitive:
   zstyle ':completion:*:complete:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

 # Auto-complementar a partir de curingas:
   zstyle ':completion:*:complete-extended:*' matcher 'r:|[.,_-]=* r:|=*'

 # Ignorar auto-complementação de funções internas do zsh:
   zstyle ':completion:*:functions' ignored-patterns '_*'

 # Auto-completar para o comando 'kill':
   zstyle ':completion:*:processes' command 'ps x -o pid,command'
   zstyle ':completion:*:kill:*' menu yes select
   zstyle ':completion:*:kill:*' force-list always
   zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

#Comando help dentro  do Zsh
  autoload -U run-help
  autoload run-help-git
  autoload run-help-svn
  autoload run-help-svk
  unalias run-help

# Sintaxe colorida # wget https://raw.githubusercontent.com/trapd00r/LS_COLORS/master/LS_COLORS -O ~/.dir$
  eval $(dircolors -b $HOME/.dircolors)


