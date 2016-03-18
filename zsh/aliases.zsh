#Aliases systemctl
alias service='systemctl list-unit-files | grep enable'
alias offservice='systemctl list-unit-files | grep disable'

#Aliase mpdviz

alias mpdviz='mpdviz --file="/tmp/mpd.fifo" --icolor=true --scale=2 --step=8 -v spectrum -d true'

#Aliases Git
alias ga='git add'
alias gcm='git commit -m'
alias gpom='git push origin master'

#Aliases - Atalhos para comandos
 alias ls='ls -CFb'
 alias la='ls -LaFb'
 alias ll='ls -lFb' 
 alias dc='dcfldd'

#Aliases diversos
 alias saidar='saidar -c'  # pacman -S libstatgrab pystatgrab; 
 #alias df='dfc -dTls' #pacman -S dfc 
 alias cp='vcp -gR' #cp avançado com suporte a barra de progresso,calculo de porcentagem e controle de dados.
 #alias ping='gping'

#Aliases  pacman
 alias pacsearch="pacman -Sl | cut -d' ' -f2 | grep " #Permite pesquisar todos os pacotes disponíveis simplesmente usando 'pacsearch packagename':
 alias pkglist="comm -13 <(pacman -Qmq | sort) <(pacman -Qqe | sort) > pkglist" # Cria  lista de todos os pacotes instalados 
 alias pacup='sudo pacman -Syu' #Sincroniza os repositórios e  atualiza caso tiver alguma atualização
 alias pacre='sudo pacman -Rns' #Remove um pacote especifico e todas as suas dependencias e configurações
 alias pacorf='sudo pacman -Rns $(pacman -Qtdq)' #Cria  lista de pacotes orfãos para remoção 
 alias pacin='sudo pacman -S' #Instala um pacote especifico

#Aliases  yaourt 
 alias yaupg='yaourt -Syua' #Sincroniza os repositórios e  atualiza caso tiver alguma atualização pelo aur 
 alias yain='yaourt -S' #Instala uma pacote especifico 
 alias yarem='yaourt -Rns' #Remove um pacote especifico e todas as suas dependencias e configurações
 alias yare='yaourt -R'  #Remove um pacote esṕecifico,mas não remove  as suas dependencias e configurações

#Erros típicos
 alias cd..='cd ..'
 alias ...='cd ..'
 alias ....='cd ../..'

#Que a força esteja com vc 
 alias starwars="telnet towel.blinkenlights.nl"

#Agenda
 alias agenda='calcurse'

#lista os 20  ultimos comandos executados no shell
 alias top20='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 20'

#Processos usados pela Web
 alias ports='lsof -i -n -P'

#Colorindo o comando cat  # pacman  -S lolcat 
  alias cat='lolcat'

#Comando help dentro  do Zsh
  alias help='run-help'

# Screenfetch colorido
  alias sf='screenfetch | lolcat'

#Sintaxe colorida 
 alias ls="ls -F -h --color=auto"
