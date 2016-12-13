let s:mappings = {
\   '<C-a>': '<Home>',
\   '<C-b>': '<Left>',
\   '<C-e>': '<End>',
\   '<C-f>': '<Right>',
\   '<C-t>': '<Esc>',
\   '<M-b>': '<S-Left>',
\   '<M-d>': '<Esc>',
\   '<M-f>': '<S-Right>',
\ }

function! zsh#DefineMappingsForInsertMode()
  call zsh#DefineMappingsForMode('i', extend(s:mappings, {
  \   '<C-k>': '<Esc>Di',
  \   '<C-n>': '<Down>',
  \   '<C-p>': '<Up>',
  \   '<C-u>': '<Esc>0d$i',
  \ }))
endfunction

function! zsh#DefineMappingsForCommandMode()
  call zsh#DefineMappingsForMode('c', extend(s:mappings, {
  \   '<C-k>': '<Esc>',
  \   '<C-u>': '<C-c>:',
  \ }))
endfunction

function! zsh#DefineMappingsForCommandModeSearchHistory(tool)
  exec 'cnoremap <silent><expr> <C-r> zsh#CommandModeSearchHistory("' . a:tool . '")'
endfunction

function! zsh#DefineMappingsForMode(mode, mappings)
  for lhs in keys(a:mappings)
    exec a:mode . 'noremap ' . lhs . ' ' . a:mappings[lhs]
  endfor
endfunction

function! zsh#CommandModeSearchHistory(tool)
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
