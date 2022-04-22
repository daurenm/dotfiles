set fish_greeting ""

# aliases

# nvim
if type -q nvim
  alias vim "nvim"
end

# exa
if type -q exa
  alias ls "exa"
  alias ll "exa -l"
  alias la "ll -a"
end

# git
if type -q git 
  alias g git
	alias ga "g add"
	alias gaa "g add ."
	alias gc "g commit"
	alias gclean "g reset --hard"
	alias gs "g status --short"
	alias gss "g status"
	alias go "g checkout"
	alias gg "g pull"
	alias gd "g diff"
	alias gl "g log --graph --pretty=format:'%Cred%h%Creset %C(bold blue)%an%C(reset) - %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
