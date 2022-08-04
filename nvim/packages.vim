if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'tpope/vim-sensible'

  " CoC
  "Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}

  let g:coc_global_extensions = ['coc-eslint', 'coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-prettier']

  "Plug 'fannheyward/coc-markdownlint',  {'do': 'yarn install --frozen-lockfile'}
  "Plug 'fannheyward/coc-marketplace', {'do': 'yarn install --frozen-lockfile'}
  Plug 'fannheyward/coc-sql', {'do': 'yarn install --frozen-lockfile'}
  Plug 'iamcco/coc-diagnostic',  {'do': 'yarn install --frozen-lockfile && yarn run build'}
  Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}

  Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}

  " Syntax Highlighting
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jparise/vim-graphql'
  Plug 'rking/ag.vim'

  " Code Completion
  Plug 'neoclide/coc-tabnine', {'do': 'yarn install --frozen-lockfile'}

  " Auto-save
  Plug '907th/vim-auto-save'

  " Vim Wiki
  Plug 'vimwiki/vimwiki'

  " Colors
  Plug 'ap/vim-css-color'

  Plug 'sheerun/vim-polyglot'
  let g:rustfmt_autosave = 1

  "Buffer Explorer
  Plug 'jlanzarotta/bufexplorer'

  " git
  Plug 'f-person/git-blame.nvim'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  "Plug 'idanarye/vim-merginal'
  "Plug 'mhinz/vim-signify'
  "set updatetime=100

  " text editing
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-endwise'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree'
  let NERDTreeIgnore=['\~$', 'tfstate$', 'tfstate\.backup$']
  Plug 'junegunn/vim-easy-align'
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)

  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)

  " Markdown
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

  " Ruby
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  "Plug 'tpope/vim-rake', { 'for': 'ruby' }

  " Testing
  "Plug 'vim-test/vim-test'
  " https://github.com/vim-test/vim-test#cli-options
  "let g:test#runner_commands = ['ExUnit', 'ElmTest']

  " search
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

  " color themes & usability
  Plug 'flazz/vim-colorschemes'
  Plug 'Yggdroot/indentLine'
  let g:indentLine_enabled = 0
  map <F9> :IndentLinesToggle<CR>
  Plug 'itchyny/lightline.vim'
  let g:lightline = {
        \ 'colorscheme': 'jellybeans',
        \ }

call plug#end()
