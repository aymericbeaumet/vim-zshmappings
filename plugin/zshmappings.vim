if exists('g:zshmappings_loaded')
  finish
endif
let g:zshmappings_loaded = 1

let g:zshmappings_command_mode_mappings = get(
\ g:,'zshmappings_command_mode_mappings', 1)

let g:zshmappings_command_mode_search_tool = get(
\ g:,'zshmappings_command_mode_search_tool', '')

let g:zshmappings_insert_mode_mappings = get(
\ g:,'zshmappings_insert_mode_mappings', 1)

" Define the insert mode mappings
if g:zshmappings_insert_mode_mappings
  call zshmappings#define_mappings_for_insert_mode()
endif

" Define the command mode mappings
if g:zshmappings_command_mode_mappings
  call zshmappings#define_mappings_for_command_mode(g:zshmappings_command_mode_search_history_tool)
endif
