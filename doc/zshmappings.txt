*zshmappings.txt*

Author:  Aymeric Beaumet <hi@aymericbeaumet.com> (https://aymericbeaumet.com)
License: https://creativecommons.org/publicdomain/zero/1.0

==============================================================================
CONTENTS						 *zshmappings-contents*

1. Introduction			|zshmappings-introduction|
2. Install			|zshmappings-install|
3. Settings			|zshmappings-settings|

==============================================================================
1. Introduction					     *zshmappings-introduction*

I've been developping a muscular memory for the Zsh bindings, in fact
I use them as soon as I can. I feel frustrating not being able to use them in
Vim, this plugin solves that issue by exposing those bindings in the command
and insert modes.

==============================================================================
2. Install						  *zshmappings-install*

Using vim-plug (https://github.com/junegunn/vim-plug):

>
    Plug 'aymericbeaumet/zshmappings.vim'
<

==============================================================================
3. Settings						 *zshmappings-settings*

You can configure this plugin through the following global variables.

------------------------------------------------------------------------------
*g:ZshMappings_loaded*

If set, turn off the script.

>
    let g:ZshMappings_loaded = 1
<

------------------------------------------------------------------------------
*g:ZshMappings_command_mode_mappings*

Values: `0` or `1`
Default: `1`

If set to `1`, define the command mode mappings.

>
    let g:ZshMappings_command_mode_mappings = 1
<

------------------------------------------------------------------------------
*g:ZshMappings_command_mode_search_history_tool*

Values: `''` or `'fzf.vim'`
Default: `''`

If set, will define the mapping to search the command history ala Zsh (^R).
Only support `fzf.vim` for now.

>
    let g:ZshMappings_command_mode_search_history_tool = 'fzf.vim'
<

------------------------------------------------------------------------------
*g:ZshMappings_insert_mode_mappings*

Values: `0` or `1`
Default: `1`

If set to 1, define the insert mode mappings.

>
    let g:ZshMappings_insert_mode_mappings = 1
<

==============================================================================
vim:tw=78:ts=8:ft=help:norl
