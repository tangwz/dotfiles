" ----------------------------------------------------------------------
" | General Settings                                                   |
" ----------------------------------------------------------------------

set nocompatible               " Don't make Vim vi-compatibile.

syntax on                      " Enable syntax highlighting.

set autoindent                 " Indent according to previous line.

set fileencoding=utf-8
set encoding=utf-8             " Use UTF-8.

set backspace=indent,eol,start " Allow `backspace` in insert mode.

if has('extra_search')
    set hlsearch               " Enable search highlighting.
    set incsearch              " Highlight search pattern as it is being typed.
endif

set ignorecase                 " Ignore case in search patterns.

set tabstop=4                  " ┐
set softtabstop=4              " │ Set global <TAB> settings.
set shiftwidth=4               " │
set expandtab                  " ┘

set number                     " Show line number.

set tags=./.tags;,.tags        " Set directory for ctags.



" ----------------------------------------------------------------------
" | Plugins                                                            |
" ----------------------------------------------------------------------

" Use `vim-plug` to manage the Vim plugins.
" https://github.com/junegunn/vim-plug

" Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'ludovicchabant/vim-gutentags'
Plug 'w0rp/ale'
Plug 'mhinz/vim-signify'
Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/LeaderF'
Plug 'chr4/nginx.vim'
Plug 'fatih/vim-go'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Shougo/echodoc.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" ------------------------------------------------------------------------------
" | Plugins - vim-gutentags                                                    |
" ------------------------------------------------------------------------------

let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
 
let g:gutentags_ctags_tagfile = '.tags'
 
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
 
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']


" ------------------------------------------------------------------------------
" | Plugins - YouCompleteMe                                                    |
" ------------------------------------------------------------------------------

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
set completeopt=menu,menuone
 
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }


" ----------------------------------------------------------------------
" | Color Scheme                                                       |
" ----------------------------------------------------------------------
set t_Co=256                   " Enable full-color support.

set background=dark            " Use colors that look good on a dark background.

colorscheme molokai            " Use custom color scheme.

let g:molokai_original = 1     " Match the original monokai background color

