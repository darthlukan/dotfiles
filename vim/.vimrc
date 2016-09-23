" .vimrc
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

" For multi-byte character support (CJK support, for example):
"set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1

set shell=/usr/bin/zsh
set nocompatible

filetype off
filetype plugin indent off

" Begin vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

filetype plugin on
filetype plugin indent on
syntax on

" Bundles
Bundle 'VundleVim/Vundle.vim'
Bundle 'itchyny/lightline.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'fatih/vim-go'
Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
Bundle 'airblade/vim-gitgutter'
Bundle 'junegunn/vim-github-dashboard'

"lightline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
set ambiwidth=single
set laststatus=2

let g:lightline = {}
let g:lightline.colorscheme = 'wombat'
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }

" Github Dashboard
let g:github_dashboard = { 'username': 'darthlukan', 'password': $GITHUB_TOKEN }

" Nerdtree
map <F2> :NERDTreeToggle<CR>

" Tagbar
map <F3> :TagbarToggle<CR>

" Sytastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" SuperTab
let g:SuperTabDefaultCompletionType = "context"

"YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" gotags
let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds' : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin' : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
\ }


" Autoformatting and stuff
augroup vimrc_autocmds
    autocmd!
    " Highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    autocmd FileType python set tabstop=4
    autocmd FileType python set softtabstop=4
    autocmd FileType python set shiftwidth=4
    autocmd FileType python set textwidth=120
    autocmd FileType python set expandtab
    autocmd FileType python set autoindent
    autocmd FileType python set fileformat=unix
    " Format go files on save
    autocmd FileType go autocmd BufWritePre <buffer> Fmt
    autocmd BufWritePost $HOME/.vimrc nested source $HOME/.vimrc
augroup END

au BufNewFile,BufRead *Pkgfile set filetype=sh
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

set encoding=utf-8
set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
set softtabstop=4
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
 
set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
 
set showcmd         " Show (partial) command in status line.

set number          " Show line numbers.

set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.
 
set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
 
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
 
set ignorecase      " Ignore case in search patterns.
 
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
 
set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.
 
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).  
set textwidth=120    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.
 
set formatoptions=q,r,t " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode. 
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)
 
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
 
set background=dark " When set to "dark", Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.
 
set mouse=a         " Enable the use of the mouse.
set laststatus=2
set showtabline=2
set noshowmode
set autochdir
set clipboard=unnamed
set colorcolumn=120
set nobackup
set nowritebackup
set noswapfile
set noundofile
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
set termencoding=utf-8
set term=xterm-256color

if has ('gui_running')
    highlight Pmenu guibg=#0a0a0a gui=bold
else
    set t_Co=256
endif
