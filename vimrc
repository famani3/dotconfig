" ----------
" Vim Config
" ----------
"
"
" How this works:
"
" This file is minimal.  Most of the vim settings and initialization is in
" several files in .vim/init.  This makes it easier to find things and to
" merge between branches and repos.
"
" Please do not add configuration to this file, unless it *really* needs to
" come first or last, like Vundle and sourcing the machine-local config.
" Instead, add it to one of the files in .vim/init, or create a new one.

set nocompatible               " be iMproved
filetype off                   " required!

" Based on http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let need_to_install_plugins=0
if empty(system("grep lazy_load ~/.vim/bundle/vundle/autoload/vundle.vim"))
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !rm -rf ~/.vim/bundle/vundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let need_to_install_plugins=1
endif

" Escape (esc)
imap jj <Esc>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()


Plugin 'gmarik/vundle'

"
" Colorschemes
"
Plugin 'tpope/vim-vividchalk'
Plugin 'chriskempson/base16-vim'
Plugin 'molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'wgibbs/vim-irblack'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'candycode.vim'
Plugin 'Color-Sampler-Pack'
Plugin 'flazz/vim-colorschemes'

"
" Ruby / Rails
"
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'jgdavey/vim-blockle'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-rake'

"
" General Editing
"
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kana/vim-textobj-user'
Plugin 'Julian/vim-textobj-variable-segment'
Plugin 'kana/vim-textobj-line'
Plugin 'thinca/vim-textobj-between'
Plugin 'tpope/vim-unimpaired'
Plugin 'sjl/gundo.vim'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ervandew/supertab'
Plugin 'matt-royal/diffthese'
Plugin 'camelcasemotion'
Plugin 'mgamba/edit-plus'
Plugin 'brysgo/quickfixfix'
Plugin 'regreplop.vim'
Plugin 'vim-scripts/L9'
Plugin 'Peeja/vim-cdo'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'YankRing.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-projectionist'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'nathanaelkane/vim-indent-guides'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" Window Management
"
Plugin 'ZoomWin'
Plugin 'easymotion/vim-easymotion'

"
" Searching
"
Plugin 'mileszs/ack.vim'
Plugin 'epmatsw/ag.vim'
Plugin 'tpope/vim-abolish'
Plugin 'henrik/vim-qargs'
Plugin 'kien/ctrlp.vim'

"
" Navigation
"
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

"
" Languages
"
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'slim-template/vim-slim'
Plugin 'nono/vim-handlebars'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-cucumber'
Plugin 'quentindecock/vim-cucumber-align-pipes'
Plugin 'juvenn/mustache.vim'
Plugin 'Blackrush/vim-gocode'
Plugin 'rosstimson/scala-vim-support'
Plugin 'guns/vim-clojure-static'
Plugin 'chrisbra/csv.vim'
Plugin 'elzr/vim-json'
Plugin 'briancollins/vim-jst'
Plugin 'digitaltoad/vim-jade'
Plugin 'mxw/vim-jsx'
Plugin 'isRuslan/vim-es6'
Plugin 'ap/vim-css-color'

"
" Development Tool Integration
"
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'pivotal/tmux-config'
Plugin 'tpope/vim-dispatch'
Plugin 'carlobaldassi/ConqueTerm'
Plugin 'sjl/vitality.vim'
Plugin 'brysgo/test_server'
Plugin 'klen/python-mode'

call vundle#end()
filetype plugin indent on

syntax on

if need_to_install_plugins == 1
  echo "Installing plugins via Vundle. Please ignore warnings afterwards."
  echo "This is a one-time operation that will take about a minute..."
  silent! PluginInstall
  echo "Done installing Vundle plugins!"
  q
endif

runtime! init/**.vim

if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

au BufRead,BufNewFile *.hamlc set ft=haml

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = '/workspace/NFL/WebClient/node_modules/.bin/eslint'
let g:syntastic_python_checkers = ['pyflakes']

let g:pymode_lint_checkers = ['pyflakes']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ctrlp_custom_ignore = '\v[\/](JavaProjects|3rdParty|ScalaProjects|docs|node_modules|venv|json_config)'
let g:jsx_ext_required = 0

let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_rope_goto_definition_cmd = 'new'
let g:pymode_rope_complete_on_dot = 0
