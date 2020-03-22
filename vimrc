" The original configuration https://github.com/ArthurGorgonio/Dotfiles/blob/master/vimrc
" copy in: 2019 Dec 07

""""""""""""""""""""""""""""""""""""""""
"        Vim Configuration File        "
"     Maintainer: Gabriel Augusto      "
"       Last Change: 2020 Mar 22       "
""""""""""""""""""""""""""""""""""""""""

""" COLORS CODE
" I choose these colors to customize the rainbow parentheses plugin. These
" colors are ordened by xterm code. The follow lines represent a list of the
" colors than I use.
" Code color in xterm - the name of the color - the code in rgb
" 009 -    Red     - #FF0000
" 010 -   Green    - #00FF00
" 011 -   Yellow   - #FFFF00
" 013 -  Fuchsia   - #FF00FF
" 014 -    Aqua    - #00FFFF
" 021 -    Blue    - #0000FF
" 059 -   Grey37   - #5F5F5F
" 202 - OrangeRed1 - #FF5F00
"
" The follow links were used to choose the colors and the icon in the configuration
" color: https://jonasjacek.github.io/colors/
""" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible  " be iMproved, required
filetype off      " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' "Pluguin manager

" Plugins
Plugin 'vim-airline/vim-airline' " Airline
Plugin 'vim-airline/vim-airline-themes' " Airline themes
Plugin 'scrooloose/nerdtree' " Nerd Tree
Plugin 'tpope/vim-fugitive'
Plugin 'luochen1990/rainbow' " Rainbow match
Plugin 'w0rp/ale' " Systax check
Plugin 'maralla/completor.vim' " Suggests words
Plugin 'davidhalter/jedi-vim' " Jedi Pluguin

" Color schemes
Plugin 'dracula/vim', { 'name': 'dracula' }

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Plugins configurations
" ALE
let g:ale_fix_on_save = 1
let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_fixers = {
    \ 'python': [
    \   'add_blank_lines_for_python_control_statements',
    \   'autopep8',
    \   'black',
    \   'isort',
    \   'remove_trailing_lines',
    \   'trim_whitespace',
    \   'yapf'
    \ ]
    \}

" Rainbow Parenteses
"'parentheses': ['start=/(/ end=/)/ fold'
" the word fold indicates that (), [], and {} are colored individually by the
"   sectioned sequence
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
      \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \   'ctermfgs': [9, 10, 11, 21, 13, 14, 22, 202],
      \   'operators': '_,_',
      \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold',
      \       'start=/{/ end=/}/ fold'],
      \   'separately': {
      \     '*': {},
      \     'tex': {
      \       'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/',
      \           'start=/\{\ end=/\}\ '],
      \     },
      \     'lisp': {
      \       'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick',
      \           'darkorchid3'],
      \     },
      \     'vim': {
      \       'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/',
      \           'start=/{/ end=/}/ fold',
      \           'start=/(/ end=/)/ containedin=vimFuncBody',
      \           'start=/\[/ end=/\]/ containedin=vimFuncBody',
      \           'start=/{/ end=/}/ fold containedin=vimFuncBody'],
      \     },
      \  }
      \}

" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='wombat'

" NerdTree Configuration
" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2

" Completor
let g:completor_clang_binary = '/usr/bin'

syntax on

" Basic configurations
let python_highlight_all=1
set autoindent
set bs=2 "backspace working well
set clipboard=unnamed
set colorcolumn=80
set cursorline
set encoding=utf8
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set noshowmode
set noswapfile
set number
set pastetoggle=<F12> " sane identation on pastes
set ruler
set shiftwidth=2
set showbreak=···
set showcmd
set showtabline=2
set smartcase
set smartindent
set smarttab
set softtabstop=2
set t_Co=256
set undolevels=1000

" Setting color scheme
colorscheme dracula

" Remaping commands
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
