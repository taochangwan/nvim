"                                _           
"        _ __ ___  _   _  __   _(_)_ __ ___  
"       | '_ ` _ \| | | | \ \ / / | '_ ` _ \ 
"       | | | | | | |_| |  \ V /| | | | | | |
"       |_| |_| |_|\__, |   \_/ |_|_| |_| |_|
"                   |___/                     

"===
"===first load nvim then install plugins
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
  silent execute '!curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"===
"=== auto back to last cursorline
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"===
"=== common set
set nocompatible

let mapleader=","

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

syntax enable
syntax on

" set t_Co=256
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"

" enable true color
set termguicolors 
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" set cmdheight=2

set hidden

set shortmess+=c

set updatetime=100

set shortmess+=c

set showcmd

set wrap

set number

set relativenumber

set cursorline

set virtualedit=block,onemore

set ruler

set autoindent

set cindent

" set cinoptions=g0,:0,N-s,(0

set smartindent

set expandtab

set tabstop=4

set shiftwidth=4

set softtabstop=4

" set smarttab

set backspace=2

set wildmenu

set completeopt-=preview

set foldmethod=syntax

set autoread

set autowrite

set foldmethod=indent
set foldlevel=99

set scrolloff=5

set ignorecase
set smartcase

set colorcolumn=100

set laststatus=2

silent !mkdir -p $HOME/.config/nvim/tmp/backup
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.

"=== 
"=== self key map

"===
"=== j keys
inoremap jj <esc>

"===
"=== leader keys
nnoremap <leader>e :e $MYVIMRC<cr>

nnoremap <leader>r :source $MYVIMRC<cr>

" key binding for split window motion 
nnoremap <leader>w <C-w>w
nnoremap <leader>k <C-w>k
nnoremap <leader>j <C-w>j
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>c <C-w>o

" key binding for nohighlight
nnoremap <leader><cr> :nohl<cr>

" key binding for fold
nnoremap <slient> <leader>] za

"===
"=== Q quit
nnoremap Q :q<cr>

"===
"=== W write to file
nnoremap S :w<cr>

"===
"=== fast move
nnoremap H 5h<cr>
nnoremap J 5j<cr>
nnoremap K 5k<cr>
nnoremap L 5l<cr>

"===
"=== indent keys
nnoremap < <<
nnoremap > >>

"===
"=== split window keys

"===
"=== s keys
nnoremap su :set nosplitbelow<cr>:split<cr>:set splitbelow<cr>
nnoremap sd :set splitbelow<cr>:split<cr>
nnoremap sr :set nosplitright<cr>:vsplit<cr>:set splitright<cr>
nnoremap sl :set splitright<cr>:vsplit<cr>

"===
"=== resize window keys 
noremap <up> :res +5<cr>
noremap <down> :res -5<cr>
noremap <left> :vertical resize-5<cr>
noremap <right> :vertical resize+5<cr>

"===
"=== tab keys

"===
"=== t keys
noremap tu :tabe<cr>
noremap tU :tab split<cr>

noremap tn :-tabnext<cr>
noremap tN :+tabnext<cr>

noremap tmn :-tabmove<cr>
noremap tmN :+tabmove<cr>

"===
"=== Install plugs if not found

"===
"===
"===  Install  plug
call plug#begin('~/.config/nvim/plugged')
" coc.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" snazzy color scheme
Plug 'connorholyday/vim-snazzy'

" pretty dress
Plug 'theniceboy/nvim-deus'

" status line
Plug 'taochangwan/eleline.vim'
Plug 'ojroques/vim-scrollstatus'

" edit enhance 
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim' 
Plug 'Yggdroot/indentLine'
Plug 'mg979/vim-visual-multi'
Plug 'tomtom/tcomment_vim'

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" taglist
Plug 'liuchengxu/vista.vim'

" git 
Plug 'airblade/vim-gitgutter'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

" general highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'
call plug#end()


"===
"===
"=== plug settings

"===
"===pretty dress
color deus

"===
"=== rainbow
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" ===
" === nvim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- one of "all", "language", or a list of languages
  ensure_installed = {"c", "bash", "python", "cpp"},
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "" },  -- list of language that will be disabled
  },
}
EOF

"===
"=== general highlighter
let g:Hexokinase_highlighters = ['sign_column']
let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript']

"===
"===  coc.vim
" auto install coc extensions 
let g:coc_global_extensions = [
    \'coc-json',
    \'coc-pyright',
    \'coc-yaml',
    \'coc-html',
    \'coc-css',
    \'coc-eslint',
    \'coc-explorer',
    \'coc-diagnostic']

nmap <space>e <Cmd>CocCommand explorer<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-o> coc#refresh()

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
nnoremap <C-h> :call Show_documentation()<CR>
