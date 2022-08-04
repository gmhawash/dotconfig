" FZF and Ripgrep  
command! -bang -nargs=* Files call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{web/**/*/__generated__/*,web/node_modules/*,.git/*,backend/sorbet/*,backend/tmp/*,backend/log/*,backend/storage/*,backend/coverage/*}"' }))
command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --glob "!{*/package-lock.json,*/yarn.lock,web/**/*/__generated__/*,web/node_modules/*,.git/*,backend/sorbet/*,backend/tmp/*,backend/log/*,backend/storage/*,backend/coverage/*}" --smart-case -- '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

" fuzzy find files in the working directory (where you launched Vim from)
nmap <leader>f :Files<cr>

" fuzzy find lines in the current file
nmap <leader>/ :BLines<cr>

" fuzzy find an open buffer
nmap <leader>b :Buffers<cr>

" fuzzy find text in the working directory
nmap <leader>r :Rg<cr>

" fuzzy find word under cursor in the working directory
nmap <leader>rr :Rg <C-R><C-W><cr>
