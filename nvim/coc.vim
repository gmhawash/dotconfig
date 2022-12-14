"let g:coc_global_extensions = ['coc_prettier', 'coc_json']
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Confirm completion
"inoremap <expr><cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-rename)
" Fix autofix problem of current line
nmap <silent> gx <Plug>(coc-fix-current)
" Remap for do codeAction of current line
nmap <silent> ga <Plug>(coc-codeaction)
" Remap for do codeLensAction of current line
nmap <silent> gl <Plug>(coc-codelens-action)
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" View outline of current file
nnoremap <silent> <leader>co  :<C-u>CocList outline<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"let g:coc_snippet_next = '<c-l>'
"let g:coc_snippet_prev = '<c-h>'
"inoremap <silent><expr> <c-j> coc#util#has_float() ? coc#util#float_scroll_i( 1) : "\<c-j>"
"inoremap <silent><expr> <c-k> coc#util#has_float() ? coc#util#float_scroll_i(-1) : "\<c-k>"
"vnoremap <silent><expr> <c-j> coc#util#has_float() ? coc#util#float_scroll_i( 1) : "\<c-j>"
"vnoremap <silent><expr> <c-k> coc#util#has_float() ? coc#util#float_scroll_i(-1) : "\<c-k>"

command! -nargs=0 Prettier :CocCommand prettier.formatFile
