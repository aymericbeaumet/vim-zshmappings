if exists("loadednerdtree")
    finish
endif

" Grab options

if !exists('g:ZshCommandModeMappings')
  let g:ZshCommandModeMappings = 1
endif
if !exists('g:ZshCommandModeSearchHistoryTool')
  let g:ZshCommandModeSearchHistoryTool = ''
end
if !exists('g:ZshInsertModeMappings')
  let g:ZshInsertModeMappings = 1
endif

" Define the insert mode mappings

if g:ZshInsertModeMappings
  call zsh#DefineMappingsForInsertMode()
endif

" Define the command mode mappings, along with the search history tool mappings

if g:ZshCommandModeMappings
  call zsh#DefineMappingsForCommandMode()
  if len(g:ZshCommandModeSearchHistoryTool) > 0
    call zsh#DefineMappingsForCommandModeSearchHistory(g:ZshCommandModeSearchHistoryTool)
  endif
endif
