set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'jalcine/cmake.vim'
Plugin 'valloric/youcompleteme'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'easymotion/vim-easymotion'
Plugin 'altercation/vim-colors-solarized'
Plugin 'haya14busa/incsearch.vim'
Plugin 'ctrlpvim/ctrlp.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Ctrl + S in insert mode saves your file
nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>
"" Solarized colorscheme!
" Be sure to download for your terminal the color palette for solarized colors!!!
let g:solarized_termcolors = 256
set background=dark
colorscheme solarized

let mapleader = " "

" NERD Tree
" Open NERDTree when vim is opened:
"autocmd vimenter * NERDTree

" Use Ctrl+n to toggler NERDTree visibility.
" map <C-n> :NERDTreeToggle<CR>

" If the obly window left is the NERDTree window - close vim.
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vim-airline:
" Creates a tab-line at the top:
let g:airline#extensions#tabline#enabled = 1

" Use Powerline symbole:
let g:airline_powerline_fonts = 1
" Airline Theme:
let g:airline_theme='luna'
" Solves a bug in which vim-airline disappears on some cases.
set laststatus=2
" Abosulte Line Numbering at Current Line:
set nu
" Relative Line Numbering at Other Lines:
set rnu

" show matching brackets
set showmatch

" Turning on smartcase mode - if no capital letters are in the search term - the seach is case insensitive
set ignorecase
set smartcase

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" Set incremental search - finding matching element along search input
set incsearch

" Turn on wrapscan - when reaching EOF start search from beginning.
set ws

" Change navigation keys

nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>

" Moving around buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>

" YouCompleteMe shortcuts
nnoremap <Leader>1 :YcmCompleter GoToInclude<CR>
nnoremap <Leader>2 :YcmCompleter GoToDefinition<CR>

" Toggling Tagbar
nmap <F8> :TagbarToggle<CR>
nmap <C-b> :make<CR>

" Highlight current line
:set cursorline
nnoremap <Leader>5 :w<CR>:source %<CR>
" :hi CursorLine   cterm=NONE ctermbg=18 guibg=darkred

" netrw
nnoremap <C-n> :Lexplore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * :Lexplore
augroup END

"" easy motion
" automatically close vim if only netrw is left!
aug netrw_close
    au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw"|q|endif
aug END
" let me define my own mapping
let g:EasyMotion_do_mapping = 0 
" use smart case, like duh
let g:EasyMotion_smartcase = 1
"Saving ourselves some keystrokes using the leader as previx.
map <Leader> <Plug>(easymotion-prefix)
" To look for a specific character.
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" To go to a line upward.
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)
" To go to any line in any window.
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


" Enable wildmenu
set wildmenu
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=.git\*,.hg\*,.svn\*
else
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" show current position
set ruler

" cmd bar height
set cmdheight=1

" show tabs and trailing whitespace differently
 set list
 set lcs=tab:»·
 set lcs+=trail:·

" Enable autotabs
set autoindent

" Keeps history of hidden buffers
set hid

" Fix backspace for some systems
set backspace=indent,eol,start

" Fix backspace for some systems
set backspace=indent,eol,start

" Enable paste in terminal
set paste

" filetype plugin stuff
filetype plugin on
filetype indent on

" Automatically read when file is changed externally
set autoread

let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Map : to ;
nnoremap ; :

" Add additional column to the left
set foldcolumn=1

" Use space instead of tab
set expandtab

" At beginning of line - don't substitiute tab for space
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" incsearch plugin configuration
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
"removes highlighting automatically
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Ctrlp
nnoremap <c-p> :CtrlPMixed<CR>
