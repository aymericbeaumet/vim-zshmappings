if exists('g:ZshMappings_loaded')
  finish
endif
let g:ZshMappings_loaded = 1

let g:ZshMappings_command_mode_mappings = get(
\ g:,'ZshMappings_command_mode_mappings', 1)

let g:ZshMappings_command_mode_search_tool = get(
\ g:,'ZshMappings_command_mode_search_tool', '')

let g:ZshMappings_insert_mode_mappings = get(
\ g:,'ZshMappings_insert_mode_mappings', 1)

" Define the insert mode mappings

if g:ZshMappings_insert_mode_mappings
  call ZshMappings#define_mappings_for_insert_mode()
endif

" Define the command mode mappings

if g:ZshMappings_command_mode_mappings
  call ZshMappings#define_mappings_for_command_mode(g:ZshMappings_command_mode_search_history_tool)
endif
