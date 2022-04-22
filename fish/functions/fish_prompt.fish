function fish_prompt
  set -l last_command_status $status

  echo ''
  set_color purple
  echo (prompt_pwd --full-length-dirs=2)

  if test $last_command_status -eq 0 
    set_color green
  else 
    set_color red
  end
  echo '▷ '
end

