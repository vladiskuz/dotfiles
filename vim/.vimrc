"=========                
" BEHAVIOR                
"=========                                             
"" be iMproved!                  
set nocompatible   
                                                                  
" do not force to save buffers when switching to new ones
set hidden
" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase             
" use incremental search
set incsearch             
                      
                                                                                   
" ========================                                                  
" Indentation settings         
" ========================   
                                                                    
set autoindent                                         
" Number of spaces that a <Tab> shows in the text
set tabstop=4                                             
" Number of spaces to use for each step of (auto)indent
set shiftwidth=4                                 
" Make <Tab> insert indents instead of tabs at the beginning of a line
set smarttab                
" Insert spaces instead tab                                           
set expandtab
                              
set colorcolumn=80      
              
" Highlight line overlenght if more than 81 characters          
" augroup vimrc_autocmds                               
"     autocmd BufEnter * highlight OverLength ctermbg=white guibg=#592929
"     autocmd BufEnter * match OverLength /\%81v.*/
" augroup END
                                
"set formatoptions-=t           " Disable automatic text wrapping
                                
                                
" ========================          
" Plugins and color scheme                                          
" ========================    
"set rtp+=~/.vim                                   
call plug#begin('~/.vim/plugged')                  
                                        
"Plug 'ycm-core/YouCompleteMe'                                                                     
Plug 'morhetz/gruvbox'     
"Plug 'jremmen/vim-ripgrep'                                                                        
"Plug 'tpope/vim-fugitive'
"Plug 'leafgarland/typescript-vim'          
"Plug 'vim-utils/vim-man'
"Plug 'lyuts/vim-rtags'      
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'mbbill/undotree'                                            
Plug 'scrooloose/nerdTree'                   
Plug 'kien/ctrlp.vim'                       
Plug 'tomasr/molokai'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" ========================
" General settings
" ========================

" Color scheme settings
set termguicolors
set t_Co=256
" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme gruvbox
set background=dark

"color molokai

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

noremap <Space> <Nop>
"map <Space> <Leader>
let mapleader = " "


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
noremap <C-n> :NERDTreeFind<CR>
noremap <C-m> :NERDTreeToggle<CR>


nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
"nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
"nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"
"" Use `[c` and `]c` to navigate diagnostics
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"" Use U to show documentation in preview window
"nnoremap <silent> U :call <SID>show_documentation()<CR>
"
"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)
"
"" Remap for format selected region
"vmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
