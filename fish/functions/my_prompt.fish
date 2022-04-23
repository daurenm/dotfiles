function fish_prompt
  set -l last_command_status $status

  echo ''
  set_color purple
  echo -n (prompt_pwd --full-length-dirs=2) 

	if [ (_git_branch_name) ]
		set -l git_branch (git branch 3>/dev/null | sed -n '/\* /s///p')
		set_color normal 
		echo -n " on "
		set_color green
		echo -n " "
		echo -n $git_branch
	end 

	echo ''
  if test $last_command_status -eq 0 
    set_color normal
  else 
    set_color red
  end
  echo '▷ '
end

function _is_git_dir
	echo (command git rev-parse --is-inside-work-tree 2>/dev/null)
end

function _git_branch_name
  echo (command git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
end
