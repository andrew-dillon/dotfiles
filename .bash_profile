# Use vi keybindings
set -o vi

# Run the following to show vi mode in prompt:
#  echo ~/.inputrc >> 'set show-mode-in-prompt on'
#  echo ~/.inputrc >> 'set vi-cmd-mode-string "\e[48;5;253m\e[1;32m[C]\e[m\e[1;32m"'
#  echo ~/.inputrc >> 'set vi-ins-mode-string "\e[48;5;253m\e[1;32m[I]\e[m\e[1;32m"'

# Use vim as default editor
export EDITOR=vim

# Show one file/directory per line
alias ls='ls -1'

# Git aliases
alias g='git'
alias gco='git checkout'
alias gb='git branch'
alias gc='git clone'
alias gcm='git commit'
alias gp='git push'
alias gl='git log -1'
alias gs='git status'
alias gd='git diff'
alias gdm='git diff main'
alias ga='git add'
alias gm='git merge'
alias glog='git log'
alias gpull='git pull'
alias gthisbr="git branch | grep \* | cut -d ' ' -f2"
function gmm() {
  git checkout main
  git pull
  git checkout -
  git merge main
}
alias gpu='git push -u origin $(gthisbr)'

# Yarn/NPM aliases
alias ys='yarn start'

alias gjf='google-java-format --replace $(git ls-files | grep \.java$)'

# Misc aliases
alias dc='docker compose'

alias te='open -a "TextEdit" '
alias chrome='open -a "Google Chrome" '
alias firefox='open -a "Firefox" '
alias acrobat='open -a "Adobe Acrobat" '
alias foxit='open -a "Foxit Reader" '

function killport() { 
  lsof -i tcp:$1 | awk 'NR!=1 {print $2}' | xargs kill 
}
function lsr() {
  find "$1" -type f
}

alias mcp='mvn clean package -D maven.test.skip=true'

# Define function to get git branch
function parseGitBranch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\\[\e[48;5;253m\e[1;32m\] 🌐 \w\$(parseGitBranch) > \[\e[m\e[1;32m\] \[\e[m\]"

