set nu rnu
set mouse=a 
set numberwidth=1
set clipboard=unnamed
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=4 
set laststatus=2
set signcolumn=yes
set belloff=all
set noswapfile
set incsearch
set ttyfast
" command complation
set wildmenu
set wildmode=longest:full,full

syntax on
set autoindent
" show existing tab with 4 spaces width
set tabstop=4
" indentation stuff
filetype indent on
set ai
set si

" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Use the right font for MacVIM icons
set guifont=MesloLGS\ NF:h12

" set handlebars syntax to HTML
au BufReadPost *.hbs set syntax=html
au BufReadPost *.handlebars set syntax=html
au BufNewFile,BufRead,BufReadPost *.hbs set syntax=html
au BufNewFile,BufRead,BufReadPost *.handlebars set syntax=html

call plug#begin('~/.vim/plugged')
" Themes
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'


" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'vimlab/split-term.vim'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'othree/yajs.vim'
Plug 'othree/html5.vim'
Plug 'chemzqm/vim-jsx-improve'
Plug 'fatih/vim-go'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'elzr/vim-json'
Plug 'ap/vim-css-color'
Plug 'mbbill/undotree'
Plug 'valloric/youcompleteme'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'turbio/bracey.vim'
Plug 'tomlion/vim-solidity'
call plug#end()

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 0
colorscheme OceanicNext
"colorscheme gruvbox
"let g:gruvbox_contrast_dark = "hard"

let g:airline_extensions = [] 

let g:javascript_plugin_jsdoc = 1

let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \}

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

let g:bracey_refresh_on_save = 1

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','
"let g:user_emmet_leader_key='<C-Z>'

" Read .svelte files as html
au! BufNewFile,BufRead *.svelte set ft=html


let NERDTreeQuitOnOpen=1
let g:NERDTrimTrailingWhitespace = 1

let mapleader= " "

" Shortcuts
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>cu :NERDCommenterUnomment<CR>
nmap <Leader>cc :NERDCommenterComment<CR>
nmap <Leader>c :NERDCommenterToggle<CR>
nmap <Leader>p <C-p>
nmap <Leader>u :UndotreeToggle<CR>

nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>qq :q!<CR>
nmap <Leader>x :x<CR>

nmap <Leader>tn :tabnew ./<CR>
" run python3 script
nmap ,l :!python3 %<CR>
nmap ,ñ :!nodemon %<CR>
" split vertical
nmap <Leader>vs :vsplit<CR>
" split horizontal
nmap <Leader>vh :split<CR>
" change window size horizontal
nmap <Leader>h :20winc <<CR>
nmap <Leader>l :20winc ><CR>

nmap <Leader>b :Bracey<CR>
nmap <Leader>bs :BraceyStop<CR>
nmap <Leader>br :BraceyReload<CR>

filetype indent off
function F_ind()
   let n_ind = indent(line('.'))
   let n_col = col('.') - 1
   if n_col > n_ind
      return "\n" . repeat("\t", n_ind / 3)
   else
      return "\n" . repeat("\t", n_col / 3)
   endif
endfunction
imap <expr> <CR> F_ind()
