" Define the insert mode mappings

if !exists('g:zsh_insert_mode_mappings')
  let g:zsh_insert_mode_mappings = 1
endif

if g:zsh_insert_mode_mappings
  call zsh#DefineMappingsForInsertMode()
endif

" Define the command mode mappings

if !exists('g:zsh_command_mode_mappings')
  let g:zsh_command_mode_mappings = 1
endif

if !exists('g:zsh_command_mode_search_history_tool')
  let g:zsh_command_mode_search_history_tool = ''
end

if g:zsh_command_mode_mappings
  call zsh#DefineMappingsForCommandMode()
  if len(g:zsh_command_mode_search_history_tool) > 0
    call zsh#DefineMappingsForCommandModeSearchHistory(g:zsh_command_mode_search_history_tool)
  endif
endif
