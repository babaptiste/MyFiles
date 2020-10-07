set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize"
set rtp+=~/afs/.vim/bundle/Vundle.vim
call vundle#begin('~/afs/')

"let Vundle manage Vundle, required"
Plugin 'VundleVim/Vundle.vim'

"https://github.com/tpope/vim-sensible"
Plugin 'tpope/vim-sensible'
"https://github.com/scrooloose/nerdtree"
Plugin 'scrooloose/nerdtree'
"https://github.com/vim-scripts/DoxygenToolkit.vim"
Plugin 'vim-scripts/DoxygenToolkit.vim'

"All Plugin must be added before these lines"
call vundle#end()
filetype plugin indent on

runtime! plugin/sensible.vim

" for nerdTree "
nmap <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | call Start2P() | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>

nmap <C-Right> <C-w><Right>
nmap <C-Up> <C-w><Up>
nmap <C-Down> <C-w><Down>
nmap <C-Left> <C-w><Left>

" ADD a Doxygen comment "
function! Comment()
    Dox
    let l = line(".")
    let c = col(".")
    %s/^\s\*\*\s/\*\* /g
    %s/^\s\*\*$/\*\*/g
    %s/^\s\*\/$/\*\//g
    call cursor(l, c)
endfunction

"Clang the file"
function! Clang()
    exe "normal ggvG"

endfunction

"start with 4 panel"
function! Start4P()
    exe "normal \<C-w>\<Right>"
    vs
    sp
    exe "normal \<C-w>\<Right>"
    term
    call term_sendkeys(3, "bonlive -t 0.5 -w 10\<CR>")
    exe "normal \<C-w>\<C-w>\<C-w>\<C-w>\<C-w>\<C-w>\<C-w>\<Left>"
endfunction

"start with 2 panel"
function! Start2P()
    exe "normal \<C-w>\<Right>"
    vs
    exe "normal \<C-w>\<Left>"
endfunction

"tab or autocompletion"
function! Tab_()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
:inoremap <Tab> <C-R>=Tab_()<CR>
:set dictionary="/usr/dict/words"

nmap <C-c> :call Comment()<CR>
imap <C-c> <Esc>:call Comment()<CR>

set scrolloff=5
set hlsearch
set encoding=utf-8 fileencodings=
syntax on
set ts=4
set sw=4
set expandtab
set linebreak autoindent
set number
set cc=80
highlight ColorColumn ctermbg=236
set list listchars=tab:⟫·,trail:·
autocmd Filetype make setlocal noexpandtab
