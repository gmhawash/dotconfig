set shell=/bin/zsh

" allow terminal buffer size to be very large
let g:terminal_scrollback_buffer_size = 100000

" map esc to exit to normal mode in terminal too
tnoremap <ESC> <C-\><C-n>
tnoremap <C-x> <C-\><C-n><C-w>h

" Jump and Create splits easily
let g:split_term_default_shell = "zsh -f"

" Start terminal in insert mode
autocmd TermOpen term://* startinsert
autocmd TermEnter term://* startinsert
autocmd BufEnter term://* startinsert

" Quick open terminal split
nnoremap <silent> <leader>tt :vnew<CR>:terminal<CR>
