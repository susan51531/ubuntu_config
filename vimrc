set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'rking/ag.vim'
Plugin 'mattn/emmet-vim'
Plugin 'ctrlp.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'groenewege/vim-less'
Plugin 'helino/vim-json'
"Plugin 'tpope/vim-fugitive'
"Plugin 'easymotion/vim-easymotion'
"Plugin 'gcmt/breeze.vim'
" Plugin 'Raimondi/delimitMate'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
Plugin 'susan51531/vim-interestingwords'
"Plugin 'ternjs/tern_for_vim'
"Plugin 'Chiel92/vim-autoformat'
"Plugin 'majutsushi/tagbar'
"Plugin 'fatih/vim-go'
"Plugin 'artur-shaik/vim-javacomplete2'
" ARM linux tools
"Plugin 'wesleyche/SrcExpl'
"Plugin 'taglist.vim'
"Plugin 'msanders/cocoa.vim'
"Plugin 'toyamarinyon/vim-swift'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

set nobackup
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set nowritebackup " fix some fs watch problems https://github.com/gruntjs/grunt-contrib-watch/issues/13
set autoread
set cursorline
set scrolloff=2

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  set hlsearch
  set guioptions -=T
  set guioptions -=l
  set guioptions -=L
  set guioptions -=r
  set guioptions -=R
endif

syntax enable
set t_Co=256
"set t_ut=
" Switch syntax highlighting on, when the terminal has colors
"set background=dark
"colorscheme Tomorrow-Night
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


" emmet
"let g:user_emmet_install_global = 0
"autocmd FileType html,css,xml EmmetInstall
let g:user_emmet_mode='inv'
let g:user_emmet_settings = {
\  'php' : {
\    'extends' : 'html',
\    'filters' : 'c',
\  },
\  'xml' : {
\    'extends' : 'html',
\  },
\  'haml' : {
\    'extends' : 'html',
\  },
\}

set si
"autocmd FileType svg setlocal ts=4 sw=4 expandtab
set nu


" ================ Completion =======================
" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/*,*/assets/*,*/vendor/*     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
"set wildignore+=*.png,*.jpg,*.gif

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

set listchars=tab:▸\ ,eol:¬
"listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" set exrc
" set secure

set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
set undodir=~/.vim/undo/

au BufNewFile,BufRead *.handlebars set filetype=html
au BufNewFile,BufRead *.jsp set filetype=html
au BufNewFile,BufRead *.mxml set filetype=xml
"au BufNewFile,BufRead *.less set filetype=css
map <C-Space> <Nop>
imap <C-Space> <Nop> 
vmap <C-Space> <Nop>
cmap <C-Space> <Nop>
nmap <C-Space> <Nop>
               
let g:html_indent_script1 = "inc" 
let g:html_indent_style1 = "inc" 
let g:html_indent_inctags = "html,body,head"
set fileencodings=ucs-bom,utf-8,gb18030,cp936,big5,euc-jp,latin1

" tab key
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab


" http://stackoverflow.com/a/4262209/1577263
" disabled using 'vasconcelloslf/vim-interestingwords'
nnoremap <silent> <Leader>* :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
vnoremap <silent> <Leader>* :<C-U>
\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
\gvy:let @/=substitute(
\escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR>
\gV:call setreg('"', old_reg, old_regtype)<CR>:set hls<CR>
" more color:https://github.com/chriskempson/tomorrow-theme
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF', '#aeee00', '#ff0000', '#0000ff', '#b88823', '#ffa724', '#ff2c4b']
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222', '100', '80', '10', '193', '70', '178']
"let g:interestingWordsCaseSensitive = 1

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Configuration vim-javascript
let g:javascript_enable_domhtmlcss = 1
nmap <F8> :TagbarToggle<CR>
noremap <F3> :Autoformat<CR>

"let g:clang_user_options='|| exit 0'
"set shortmess+=c

" breeze.vim
" jump to all visible opening tags after the cursor position
"nmap <leader>j <Plug>(breeze-jump-tag-forward)
" jump to all visible opening tags before the cursor position
"nmap <leader>J <Plug>(breeze-jump-tag-backward)

" jump to all visible HTML attributes after the cursor position
"nmap <leader>a <Plug>(breeze-jump-attribute-forward)
" jump to all visible HTML attributes before the cursor position
"nmap <leader>A <Plug>(breeze-jump-attribute-backward)

" move to the next tag
"nmap <C-N> <Plug>(breeze-next-tag)
" move to the previous tag
"nmap <C-B> <Plug>(breeze-prev-tag)

" move to the next attribute
"nmap <C-A> <Plug>(breeze-next-attribute)
" move to the previous attribute
"nmap <C-S> <Plug>(breeze-prev-attribute)

runtime macros/matchit.vim
autocmd FileType java set omnifunc=javacomplete#Complete


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ARM linux source code
" ------------------------------
"  ctags database path
" ------------------------------
"set tags=/workspace/linux/0.11/linux-0.11-origin/tags
"set tags=/workspace/linux/linux-2.6.30.4/tags

" ------------------------------
"  cscope database path
" ------------------------------
"set csprg=/usr/bin/cscope "cscope path
"set csto=0                "cscope DB search first
"set cst                   "cscope DB tag DB search
"set nocsverb              "verbose off

" ------------------------------
"  Tag List
" ------------------------------
nmap <F7> :TlistToggle<CR>
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Inc_Winwidth=0
let Tlist_Exit_OnlyWindow=0
let Tlist_Auto_Open=0
let Tlist_Use_Right_Window=1

" ------------------------------
"  Source Explorer
" ------------------------------
nmap <F8> :SrcExplToggle<CR>
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

let g:SrcExpl_winHeight = 8
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_isUpdateTags = 0

" ------------------------------
"  NERD Tree
" ------------------------------
map <F2> :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let NERDTreeWinPos = "left"
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <leader>r :NERDTreeFind<cr>
"当打开vim且没有文件时自动打开NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"let NERDTreeIgnore = ['\.css$', '\.map', '^node_modules$']

" ref:https://github.com/jfbisson4/vim-tmux-configs/blob/master/.vimrc
" unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>
