" Indentation

let mapleader="\\"
"let localleader="\\"

set tabstop=2
set shiftwidth=2
set expandtab
retab
set formatoptions+=w
set smartindent
set number
set modeline

" copy * register to system clipboard
set clipboard=unnamed

" don't wrap long lines
set nowrap

" highlight the current line
set cursorline

" better splits
set splitright
set splitbelow
"
" folds
set foldmethod=indent
set foldcolumn=0
set foldnestmax=8
set nofoldenable

" backups
set nobackup
set nowritebackup
set noswapfile

" flash don't audibly beep
set noerrorbells
set visualbell

" omnicompletion
set completeopt-=preview

" preview replace
set inccommand=nosplit

" Show realtive to path to current file
set statusline+=%F

" Maps ctrl-[h,j,k,l] to resizing a window split
map <silent> <C-h> <C-w><
map <silent> <C-j> <C-W>-
map <silent> <C-k> <C-W>+
map <silent> <C-l> <C-w>>

" Autosave
"let g:auto_save = 1
"let g:auto_save_events = ["InsertLeave", "TextChanged"]

" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.config/nvim/init.vim \| :PlugInstall<CR>
nnoremap <silent><leader>11 :e ~/.config/nvim/init.vim<CR>

" Bind K to search for the word under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

source $HOME/.config/nvim/packages.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/ruby.vim
source $HOME/.config/nvim/json.vim
ource $HOME/.config/nvim/ignores.vim
ource $HOME/.config/nvim/testing.vim
#source $HOME/.config/nvim/git.vim
"source $HOME/.config/nvim/search.vim
"source $HOME/.config/nvim/ag.vim
"source $HOME/.config/nvim/terminal.vim

let g:indent_guides_auto_colors=0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

let g:terminal_color_0  = '#2e3436'
let g:terminal_color_1  = '#cc0000'
let g:terminal_color_2  = '#4e9a06'
let g:terminal_color_3  = '#c4a000'
let g:terminal_color_4  = '#3465a4'
let g:terminal_color_5  = '#75507b'
let g:terminal_color_6  = '#0b939b'
let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#ef2929'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'

" show trailing whitespace
set list listchars=tab:»·,trail:·,nbsp:·
highlight SpecialKey ctermfg=blue ctermbg=red guifg=blue guibg=red

" show commands while they are being typed
set showcmd

if has("autocmd")
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeHighlightCursorline=1
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['tmp/', '.yardoc', 'pkg']
let NERDTreeCascadeSingleChildDir = 0
nmap <c-e> :NERDTreeToggle<CR>:vertical res 40<CR><C-w>=
map <leader>ff :NERDTreeFind<cr>


" format the entire file
nmap <leader>fef ggVG=

" F5 trims trailing whitespace
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Switch between last two buffers
map <leader><leader> <C-^>

" " Clear highlight from last search
nnoremap <silent> <F3> :noh<CR>

" Vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
set termguicolors
set t_Co=256
set background=dark
colorscheme jellybeans

nmap gx yiW:!xdg-open <cWORD><CR> <C-r>" & <CR><CR>

" Snippets
map <Leader>k oconsole.log(
map <Leader>kk odebugger<esc>==
map <Leader>kl oconsole.log("<C-r>=expand('%:t:r')<CR>:<C-r>=line('.')<CR>")<esc>==
map <Leader>l oputs<Space>"😄#{__FILE__}:#{__LINE__} #{__method__}😄"<esc>==
map <Leader>s oputs<Space>'🔥'*80<esc>==
map <Leader>p obinding.pry<esc>==
map <leader>F yi(A { FactoryBot.create(<esc>pA) }<esc>
map <leader>fz ggO# frozen_string_literal: true<esc>

" Git stuff
map <leader>gh :0Gclog<CR>
map [q :cprev<CR>
map ]q :cnext<CR>

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

" Automatic setting of the executable bit
" http://vim.wikia.com/wiki/Setting_file_attributes_without_reloading_a_buffer
function! SetExecutableBit()
  let fname = expand("%:p")
  checktime
  execute "au FileChangedShell " . fname . " :echo"
  silent !chmod a+x %
  checktime
  execute "au! FileChangedShell " . fname
endfunction
command! Xbit call SetExecutableBit()
autocmd BufWritePost *.pl Xbit
autocmd BufWritePost *.bash Xbit
autocmd BufWritePost *.sh Xbit

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear


" %% Expands to current file folder
cnoremap %% <C-R>=expand('%:h').'/'<cr>
