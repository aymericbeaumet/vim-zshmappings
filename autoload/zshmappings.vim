function! zshmappings#define_mappings_for_command_mode(history_tool)
  call s:define_mappings_for_mode('c', extend(s:get_mappings(), {
  \   '<Esc>': '<C-f>',
  \   '<C-k>': '<Esc>',
  \   '<C-u>': '<C-c>:',
  \ }))
  if len(a:history_tool) > 0
    exec 'cnoremap <silent><expr> <C-r> zshmappings#search_command_mode_history("' . a:history_tool . '")'
  endif
endfunction

function! zshmappings#define_mappings_for_insert_mode()
  call s:define_mappings_for_mode('i', extend(s:get_mappings(), {
  \   '<C-k>': '<Esc>Di',
  \   '<C-n>': '<Down>',
  \   '<C-p>': '<Up>',
  \   '<C-u>': '<Esc>0d$i',
  \ }))
endfunction

function! zshmappings#search_command_mode_history(tool)
  let l:INTERRUPT = "\u03" " <C-c>
  let l:SUBMIT = "\u0d" " <C-m>
  if a:tool ==# 'fzf.vim'
    let l:args = string({
    \   'options': '--query=' . shellescape(getcmdline()),
    \ })
    if getcmdtype() ==# ':'
      return l:INTERRUPT . ':keepp call fzf#vim#command_history(' .  l:args . ')' . l:SUBMIT
    elseif getcmdtype() ==# '/'
      return l:INTERRUPT . ':keepp call fzf#vim#search_history(' .  l:args . ')' . l:SUBMIT
    endif
  else
    echoerr 'Unsupport history tool: ' . a:tool
  endif
  return ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:get_mappings()
  return {
  \   '<C-a>': '<Home>',
  \   '<C-b>': '<Left>',
  \   '<C-e>': '<End>',
  \   '<C-d>': '<S-BS>',
  \   '<C-h>': '<BS>',
  \   '<C-f>': '<Right>',
  \   '<C-t>': '<Esc>',
  \   '<M-b>': '<S-Left>',
  \   '<M-d>': '<Esc>',
  \   '<M-f>': '<S-Right>',
  \ }
endfunction

function! s:define_mappings_for_mode(mode, mappings)
  for lhs in keys(a:mappings)
    exec a:mode . 'noremap ' . lhs . ' ' . a:mappings[lhs]
  endfor
endfunction
