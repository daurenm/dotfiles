set fish_greeting ""

# aliases
alias g git

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

if status is-interactive
    # Commands to run in interactive sessions can go here
end
