_openrc_completions() {
  if [ "${#COMP_WORDS[@]}" -le 2 ]; then
    COMPREPLY=($(compgen -W "$(ls ~/.openrc/files/ -1)" "${COMP_WORDS[1]}"))
  else
    _command_offset 2
    return
  fi
}

complete -F _openrc_completions openrc
