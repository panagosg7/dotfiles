" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.



"------------------------------------------------------------
" Vundle
"------------------------------------------------------------

" Vundle is short for Vim bundle and is a Vim plugin manager.

set nocompatible               " be iMproved
filetype off                   " required!

if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
    !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required!)
Bundle 'gmarik/vundle'

" My Bundles here:

" original repos on github

" Fugitive: git wrapper (not terribly useful)
Bundle 'tpope/vim-fugitive'

" NerdTree: nuff said 
Bundle 'scrooloose/nerdtree'

" Tabular: tabularize...
Bundle 'godlygeek/tabular'

" NerdtreeTabs: nerdtree support
Bundle 'jistr/vim-nerdtree-tabs'

"NerdCommenter: easy commenting
Bundle 'scrooloose/nerdcommenter'

" Gundo: browse the undo tree
Bundle 'sjl/gundo.vim'

" Tagbar: display tabs (not very useful so far...)
Bundle 'majutsushi/tagbar'

" Solarized: fancy colorscheme (my fork)
Bundle 'panagosg7/vim-colors-solarized'

"VimMarkDown: syntax for markdown
Bundle 'plasticboy/vim-markdown'

" Powerline: fancy command line
Bundle 'Lokaltog/vim-powerline'

" Signify: show git information on the side
Bundle 'mhinz/vim-signify'

" Syntastic: syntax checking plugin
Bundle 'scrooloose/syntastic'

" Hdevtools: Haskell development tools
" vim-hdevtools require hdevtools - installed through cabal
Bundle 'YPares/vim-hdevtools'

" Easymotion: Hit \\ to get easy access to places around your current position
Bundle 'Lokaltog/vim-easymotion'

" LocalVim: Load your local vimrc file, named .lvimrc
Bundle 'embear/vim-localvimrc'

" Gitv: Gitk within Vim 
Bundle 'gregsexton/gitv'

" Ack: Grep-like tool within Vim - Requires acq-grep
Bundle 'panagosg7/ack.vim'

" CtrlP: Fuzzy Finder !!!
Bundle 'kien/ctrlp.vim'

" Sensible: Defaults everyone can agree on
Bundle 'tpope/vim-sensible'

" Haskell: a little better syntax
" Bundle 'urso/haskell_syntax.vim'
" Bundle 'travitch/hasksyn'

" Lushtags: better tags for Haskell
Bundle 'bitc/lushtags'

" ZoomWin: hit <C-w>o to zoom to single window
Bundle 'vim-scripts/ZoomWin'

" ToggleMouse: Use <F12> to toggle between Vim and terminal mode
Bundle 'nvie/vim-togglemouse'

" Hoogle: use hoogle search in Vim
Bundle 'Twinside/vim-hoogle'

" Haskellmode: support for GHCI in Vim
" This fork fixes the command line height
Bundle 'kniren/haskellmode-vim'

" HaskellFold: better Haskell folding
Bundle 'Twinside/vim-haskellFold'

" Session: Extended session management for Vim
Bundle 'xolox/vim-session'

" VimMisc: Miscellaneous auto-load Vim scripts - needed for session
Bundle 'xolox/vim-misc'

" TypeScript
Bundle 'https://github.com/leafgarland/typescript-vim.git'

" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed.





"------------------------------------------------------------
" Features
"------------------------------------------------------------
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without. 

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax enable

" Set Syntax for !D files
au BufNewFile,BufRead *.dref set filetype=ocaml
au BufNewFile,BufRead *.jsm set filetype=javascript

" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
"set iskeyword+=:

set textwidth=80

" Background Color
set background=light

" Colorscheme
colorscheme solarized


" Change the color of the current  line 
" XXX: slowdown => following two lines are commented out
"set cursorline
"hi CursorLine term=bold cterm=bold guibg=Grey40

" Font
" set guifont=monospace\ 8



"------------------------------------------------------------
" Must have options
"------------------------------------------------------------

" These are highly recommended options.

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline



"------------------------------------------------------------
" Usability options
"------------------------------------------------------------

" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
" set smartindent

" /taStop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 1 line, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=1

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F7> to toggle between 'paste' and 'nopaste'

set pastetoggle=<F7>
set showmode



"------------------------------------------------------------
" Indentation options
"------------------------------------------------------------

" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
set tabstop=2



"------------------------------------------------------------
" Mappings
"------------------------------------------------------------

" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Open all folds while set.
set foldenable
set foldmethod=syntax

" Tab Manupulation
map <C-Q> :q<CR>
set selectmode=mouse,key
map <F11>  :tabp<CR>
map <F12>  :tabn<CR>

" Find the word under cursor
map <C-G> *

vmap <Tab> >gv
vmap <S-Tab> <gv

" Use F2 as the make command
map <F2> :make<CR>



"------------------------------------------------------------
" MSWIN BEH
"------------------------------------------------------------

" Set options and add mapping such that Vim behaves a lot like MS-Windows
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2006 Apr 02

" bail out if this isn't wanted (mrsvim.vim uses this).
if exists("g:skip_loading_mswin") && g:skip_loading_mswin
  finish
endif

" set the 'cpoptions' to its Vim default
if 1	" only do this when compiled with expression evaluation
  let s:save_cpo = &cpoptions
endif
set cpo&vim

" set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
behave mswin

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <S-Insert>		"+gP

cmap <S-Insert>		<C-R>+

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions=fatig
endif

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" Alt-Space is System menu
if has("gui")
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>
endif

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" CTRL-Tab is Next window
"noremap <C-Tab> <C-W>w
"inoremap <C-Tab> <C-O><C-W>w
"cnoremap <C-Tab> <C-C><C-W>w
"onoremap <C-Tab> <C-C><C-W>w
map <C-right> :tabn<CR>
map <C-left> :tabp<CR>

" CTRL-F4 is Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

" make arrow keys work in visual mode
vmap <Esc>OA k
vmap <Esc>OB j
vmap <Esc>OC l
vmap <Esc>OD h
" simulate shift-arrows (select block in windows) with control-arrows
inoremap <Esc>[OA <C-O>vk
vnoremap <Esc>[OA k
inoremap <Esc>[OB <C-O>vj
vnoremap <Esc>[OB j
inoremap <Esc>[OC <C-O>vl
vnoremap <Esc>[OC l
inoremap <Esc>[OD <C-O>vh
vnoremap <Esc>[OD h

" when you place cursor in a variable name all occurences of the variable are
" highlighted. this is very useful for quick searching all occurences of the
" variable
" autocmd CursorMoved * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))



"------------------------------------------------------------
" Tag utilies
"------------------------------------------------------------

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>



"------------------------------------------------------------
" MISC
"------------------------------------------------------------

autocmd VimEnter * set vb t_vb=

set guioptions=

let tex_no_error=1

" Do not insert <++> when opening parentheses in latex etc.
let g:Imap_UsePlaceHolders = 0


" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*



"------------------------------------------------------------
" Window split
"------------------------------------------------------------

" Resize split vertically
nnoremap <silent> + :exe "resize " . (winheight(0) + 2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) - 2)<CR>

" Resize split horizontally
nnoremap <silent> > :exe "vertical resize " . (winwidth(0) + 2)<CR>
nnoremap <silent> < :exe "vertical resize " . (winwidth(0) - 2)<CR>



"------------------------------------------------------------
" Nerdtree Manipulation
"------------------------------------------------------------

" NerdTree Tabs Toggle
map <C-N> <plug>NERDTreeTabsToggle<CR>

" NerdTree Toggle
autocmd VimEnter * nmap <F3> :NERDTreeToggle<CR>
autocmd VimEnter * imap <F3> <Esc>:NERDTreeToggle<CR>a

" Open NerdTree at the directory of the current file
nmap <F4> :NERDTreeFind<CR>

" Default size
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=35



"------------------------------------------------------------
" Gundo
"------------------------------------------------------------

nnoremap <F5> :GundoToggle<CR>



"------------------------------------------------------------
" Tagbar
"------------------------------------------------------------

nmap <F8> :TagbarToggle<CR>

let g:tagbar_width=100
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1

" Special definitions for Scala
let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
    \ }



"------------------------------------------------------------
" Powerline
"------------------------------------------------------------

let g:Powerline_symbols = 'fancy'



"------------------------------------------------------------
" Haskell Development Tools
"------------------------------------------------------------

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F6> :HdevtoolsInfo<CR>

" You will probably have to add some extra options for hdevtools, for example:
"let g:hdevtools_options = '-g-hide-package -glanguage-ecmascript-pp-0.11.1 
"  \-g-XTypeSynonymInstances 
"  \-g-XFlexibleInstances 
"  \-g-XNoMonomorphismRestriction 
"  \-g-ScopedTypeVariables 
"  \-g-XTupleSections'


"------------------------------------------------------------
" Syntastic options
"------------------------------------------------------------

let g:syntastic_mode_map = { 'mode': 'passive' }


"------------------------------------------------------------
" Haskellmode options
"------------------------------------------------------------
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s -a Firefox %s"


" You may already have the following two on, please check
syntax on
filetype plugin on
"
" This assumes that ghc is in your path, if it is not, or you
" wish to use a specific version of ghc, then please change
" the ghc below to a full path to the correct one

" XXX: Disabling Haskellmode as it does not work well with Ack
au BufEnter *.hs compiler ghc

" For this section both of these should be set to your
" browser and ghc of choice, I used the following
" two vim lines to get those paths:
" :r!which google-chrome
" :r!which ghc
let g:ghc = "ghc"



"------------------------------------------------------------
" Haskell Syntax
"------------------------------------------------------------
"" How many lines should be searched for context
"let g:hasksyn_indent_search_backward = 100

"" Should we try to de-indent after a return
"let g:hasksyn_dedent_after_return = 1

"" Should we try to de-indent after a catchall case in a case .. of
"let g:hasksyn_dedent_after_catchall_case = 1



"------------------------------------------------------------
" Session options
"------------------------------------------------------------
let g:session_autosave = 'no'



"------------------------------------------------------------
" Tabman options
"------------------------------------------------------------
let g:tabman_number = 0
