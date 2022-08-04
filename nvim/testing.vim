let test#strategy = "neovim"
tmap <C-o> <C-\><C-n>

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Copy tests/line
map <Leader>ct :let @* = 'brspec ' . fnamemodify(expand("%"), ":~:.")<cr>
map <Leader>cr :let @* = 'brspec ' . fnamemodify(expand("%") . ':' . line("."), ":~:.")<cr>
map <Leader>fr :let @* = 'rails test ' . fnamemodify(expand("%"), ":~:.:s?backend/??")<cr>
map <Leader>tr :let @* = 'rails test ' . fnamemodify(expand("%") . ':' . line("."), ":~:.:s?backend/??")<cr>
