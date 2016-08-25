" ========================
" Indentation settings
" ========================

set autoindent
set tabstop=4                  " Number of spaces that a <Tab> shows in the text
set shiftwidth=4               " Number of spaces to use for each step of (auto)indent
set smarttab                   " Make <Tab> insert indents instead of tabs at the beginning of a line
set expandtab                  " Insert spaces instead tab

" Highlight line overlenght if more than 81 characters
augroup vimrc_autocmds
    autocmd BufEnter * highlight OverLength ctermbg=white guibg=#592929
    autocmd BufEnter * match OverLength /\%81v.*/
augroup END

set formatoptions-=t           " Disable automatic text wrapping


" ========================
" Plugins and color scheme
" ========================

" Setup Vundle with
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Install plugins from commands line `vim +PluginInstall +qall` or launch
" vim and run :PluginInstall

set nocompatible               " be iMproved, required for Vundle
filetype off                   " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins list
Plugin 'VundleVim/Vundle.vim'  " let Vundle manage Vundle, required

Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdTree'
Plugin 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()              " required for Vundle
filetype plugin indent on      " required for Vundle


" ========================
" General settings
" ========================

" Color scheme settings
set t_Co=256
color molokai 

syntax on                      " Turn on color suntax highlighting
set number                     " Line numbers


" ========================
" Misc
" ========================

" Disable backup and swap files - they trigger too many
" events for file system watchers
set nobackup
set nowritebackup
set noswapfile


" ========================
" Hot keys settings
" ========================

let mapleader = ","

" Quicksave command
noremap <Leader>s :update<CR>
vnoremap <Leader>s <C-C>:update<CR>
inoremap <Leader>s <C-O>:update<CR>

" Quick quit command
noremap <Leader>q :quit<CR>    " Quit current window
noremap <Leader>Q :qa!<CR>     " Quit all windows

" Map sort function to a key
vnoremap <Leader>a :sort<CR>

" Easier moving of code blocks
vnoremap < <gv 
vnoremap > >gv

" Open/close NERDTree
noremap <C-n> :NERDTreeToggle<CR>
