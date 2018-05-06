set nocompatible              " be iMproved, required
filetype plugin on                  " required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'SirVer/ultisnips' , {'do': 'mkdir -p ~/.vim/after/plugin && ln -s ~/.vim/plugged/ultisnips/after/plugin/* ~/.vim/after/plugin && mkdir -p ~/.vim/ftdetect && ln -s ~/.vim/plugged/ultisnips/ftdetect/* ~/.vim/ftdetect' }
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'lervag/vimtex'
call plug#end()

" These lines setup the environment to show graphics and colors correctly.
set nocompatible
set t_Co=256
 
let g:minBufExplForceSyntaxEnable = 1
 
if ! has('gui_running')
   set ttimeoutlen=10
   augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
   augroup END
endif
 
set laststatus=2 " Always display the statusline in all windows
set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Normal setup
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set ignorecase
set smartcase
set smarttab
set cindent
set cino=>4
set number
au FileType * setl fo-=cro
syntax on
set incsearch
set nostartofline
set ttyfast
set nocp
set mouse=a
set ttymouse=xterm
set mousemodel=extend
set switchbuf=usetab
set nowrap
set laststatus=2
set cf
"set isk+=_,$,@,%,#, " these are not word separators
set lz " do not redraw during macors
set diffopt+=iwhite
set wildmenu
set wildmode=list:longest
set hidden
set backspace=indent,eol,start
set tabpagemax=25
set scrolloff=3
set timeout timeoutlen=1000 ttimeoutlen=100
set hlsearch
"auto indent
filetype indent on
set smartindent
set autoindent
"Numpad Mapping
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Op 0
imap <Esc>On .
imap <Esc>OR *
imap <Esc>OQ /
imap <Esc>Ol +
imap <Esc>OS -
 
"Navigation mapping
noremap <Space> <PageDown>
noremap - <PageUp>
nnoremap ' `
nnoremap ` '
map <A-DOWN> gj
map <A-UP> gk
imap <A-UP> <ESC>gki
imap <A-DOWN> <ESC>gj
 
" Tab keyboard mapping
:nmap<C-h> :tabprevious<cr>
:nmap<C-l>  :tabnext<cr>
:map<C-h> :tabprevious<cr>
:map<C-l>  :tabnext<cr>
" If in insert mode, leave insert mode before moving files
:imap<C-h> <ESC>:tabprevious<cr>
:imap<C-l> <ESC>:tabnext<cr>

"colorscheme
colorscheme molokai

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_disabled_filetypes=['html']

"rainbow parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkgreen',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['brown',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"ycm
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']

"vim-snippit completion
let g:UltiSnipsUserPythonVersion = 2
let g:UltiSnipsExpandTrigger="<TAB>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:UltiSnipsEditSplit="vertical"

"CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_working_path_mode = 'ra'

" markdown
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
