" Author: Marcus Carlsson <hi@xintron.se>

if !isdirectory(expand('~/.vim/tmp/'))
    call mkdir(expand('~/.vim/tmp/backup/'), 'p', 0700)
    call mkdir(expand('~/.vim/tmp/swap/'), 'p', 0700)
    call mkdir(expand('~/.vim/tmp/undo/'), 'p', 0700)
endif

if has("vim_starting")
    " Needed for neobundle to work
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    for f in split(globpath(split(&runtimepath, ',')[0], '*.vim'), '\n')
        if (f =~ '\v0[0-9].+\.vim')
            exe 'source'.f
        endif
    endfor
endif

call neobundle#begin(expand("~/.vim/bundle/"))
NeoBundleFetch "Shougo/neobundle.vim"


" Misc plugins
NeoBundle "Shougo/neocomplete.vim"
NeoBundle "Shougo/unite.vim"
NeoBundle "Shougo/neossh.vim"
NeoBundle "Shougo/vimfiler.vim"
NeoBundle "Shougo/vimproc.vim", {
    \ "build": {
    \       "mac": "make -f make_mac.mak",
    \       "unix": "make -f make_unix.mak"
    \   },
    \ }

NeoBundle "tpope/vim-surround"
NeoBundle "tpope/vim-fugitive"

NeoBundle "scrooloose/syntastic"
NeoBundle "bling/vim-airline"
NeoBundle "ervandew/supertab"
NeoBundle "rking/ag.vim"
NeoBundle "majutsushi/tagbar"
NeoBundle "sjl/gundo.vim"
NeoBundle "Mark"
NeoBundle "tsukkee/unite-tag"

" Python Plugins
NeoBundle "davidhalter/jedi-vim"
NeoBundle "SirVer/ultisnips"
NeoBundle "honza/vim-snippets"

" PHP
NeoBundle "StanAngeloff/php.vim"
NeoBundle "shawncplus/phpcomplete.vim"
NeoBundle "rayburgemeestre/phpfolding.vim"

" JavaScript (and the likes)
NeoBundle "gkz/vim-ls" " LiveScript support
NeoBundle "kchmck/vim-coffee-script"

" Haskell
NeoBundle "eagletmt/ghcmod-vim"
NeoBundle "eagletmt/neco-ghc"
NeoBundle "Twinside/vim-hoogle"
NeoBundle "travitch/hasksyn"
" NeoBundle "raichoo/haskell-vim"

" Syntax files
NeoBundle "evanmiller/nginx-vim-syntax"
NeoBundle "tpope/vim-markdown"
NeoBundle "pangloss/vim-javascript"
NeoBundle "robbles/logstash.vim"

" Colors
NeoBundle "chriskempson/vim-tomorrow-theme"

call neobundle#end()
NeoBundleCheck

" Enable *after* loading plugins
filetype plugin indent on
syntax on

colorscheme Tomorrow-Night

hi Conditional ctermfg=139
hi Statement ctermfg=167

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
