#   _________  _   _ ____   ____ 
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |    
# _ / /_ ___) |  _  |  _ <| |___ 
#(_)____|____/|_| |_|_| \_\\____|
#
#############################################################################################################

#.zshrc - Arquivo de inicialização do Z shell                                                               # 
#Criado por: Thiago Silva                                                                                   #
#Email :thiagors1983@gmail.com                                                                              #
#Baseado na configuração usada pelo Sandro Marcel  (https://www.vivaolinux.com.br/etc/.zshrc-SMarcell)      # 
#Linux  é o poder                                                                                           # 
#Antes de usar vejam com atenção toda a configuração e satisfaçam as dependencias para o pleno funcionamento#
#Os aliases usado nessa configuração são exclusivos do Arch e derivados.                                    #
#############################################################################################################

# text normal colors
red='\e[0;31m'
blue='\e[0;34m'
cyan='\e[0;36m'
green='\e[0;32m'
yellow='\e[0;33m'

# text bright colors
bred='\e[0;91m'
bblue='\e[0;94m'
bcyan='\e[0;96m'
bgreen='\e[0;92m'
byellow='\e[0;93m'
bwhite='\e[0;97m'

# reset color
NC='\e[0m'

# Variaveis: 
  export BROWSER="firefox"
  export EDITOR="vim"

# Zsh-syntax-highlighting 
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  #Syntax-highlighting semelhante ao do shell Fish é  necessário instalar o pacote  zsh-syntax-highlighting 

# pkgfile  inclui um gancho para "command-not-found"  que irá procurar automaticamente nos repositórios oficiais, ao entrar em um comando não reconhecido.È necessário instalar o pacote  pkgfile
  source /usr/share/doc/pkgfile/command-not-found.zsh

# Histórico:
   export HISTFILE=${HOME}/.zsh_history
   export HISTSIZE=5000
   export SAVEHIST=$HISTSIZE 


   export PYTHONPATH=/usr/lib/python3.5/site-packages
   source /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
   source ~/zsh/aliases.zsh
   source ~/zsh/functions.zsh
   source ~/zsh/keymap.zsh
   source ~/zsh/config.zsh



