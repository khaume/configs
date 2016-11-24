" Author: Marcus Carlsson <hi@xintron.se>

if !isdirectory(expand('~/.config/nvim/tmp/'))
    call mkdir(expand('~/.config/nvim/tmp/backup/'), 'p', 0700)
    call mkdir(expand('~/.config/nvim/tmp/swap/'), 'p', 0700)
    call mkdir(expand('~/.config/nvim/tmp/undo/'), 'p', 0700)
endif
set backupdir=~/.config/nvim/tmp/backup/
set directory=~/.config/nvim/tmp/swap/
set undodir=~/.config/nvim/tmp/undo/

if has("vim_starting")
    for f in split(globpath(split(&runtimepath, ',')[0], '*.vim'), '\n')
        if (f =~ '\v0[0-9].+\.vim')
            exe 'source'.f
        endif
    endfor
endif

call plug#begin('~/.config/nvim/plug/')

" Misc plugins
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/vimproc.vim', {'do': 'make'}

Plug 'tpope/vim-surround'

Plug 'mrtazz/simplenote.vim'
Plug 'ervandew/supertab'

" Code styling
Plug 'Yggdroot/indentLine'

" Colors
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'

Plug 'neomake/neomake'
Plug 'bling/vim-airline'
Plug 'rking/ag.vim'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'raimondi/delimitmate'

Plug 'luochen1990/rainbow'

Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'

" Python Plugins
Plug 'davidhalter/jedi-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" PHP
Plug 'vim-php/vim-php-refactoring'
Plug 'mkusher/padawan.vim'
Plug 'joonty/vdebug'

" JavaScript (and the likes)
Plug 'gkz/vim-ls' " LiveScript support
Plug 'kchmck/vim-coffee-script'
Plug 'justinj/vim-react-snippets'
Plug 'mxw/vim-jsx'
Plug 'isRuslan/vim-es6'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'gavocanov/vim-js-indent'
Plug 'elmcast/elm-vim'
Plug 'elzr/vim-json'
" Used for javascript Tern completion
Plug 'ternjs/tern_for_vim', {'do': 'source ~/.nvm/nvm.sh && npm install'}

" CSS
Plug 'groenewege/vim-less'

" Haskell
Plug 'eagletmt/neco-ghc'
Plug 'eagletmt/ghcmod-vim'
Plug 'neovimhaskell/haskell-vim'

" Go
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', {'do': 'make'}
"Plug 'nsf/gocode', {'rtp': 'nvim', 'do': '~/.config/nvim/plug/gocode/nvim/symlink.sh'}

" LaTeX
Plug 'lervag/vimtex'

" Syntax files
Plug 'evanmiller/nginx-vim-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'robbles/logstash.vim'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'saltstack/salt-vim'
Plug 'stephpy/vim-yaml'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'digitaltoad/vim-jade'
Plug 'cespare/vim-toml'

call plug#end()

" Enable *after* loading plugins
filetype plugin indent on
syntax on

colorscheme gruvbox
let g:airline_theme='gruvbox'
set background=dark

hi User1 ctermfg=0 ctermbg=6
hi User2 ctermfg=0 ctermbg=9
hi User3 ctermfg=0 ctermbg=2
hi User4 ctermfg=0 ctermbg=5
hi User5 ctermfg=0 ctermbg=1
hi User6 ctermfg=0 ctermbg=7

for f in split(globpath(split(&runtimepath, ',')[0], 'after/*.vim'), '\n')
    if (f =~ '\v0[0-9].+\.vim')
        exe 'source'.f
    endif
endfor
