" Some settings adapted from
" https://dougblack.io/words/a-good-vimrc.html
" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim

" Some settings and plugins adapted from
" https://github.com/lomky/dot-files/blob/main/vim/.vimrc

" Plugin Manager ------------------------------------------
" vim-plug: A vim plugin manager
" https://github.com/junegunn/vim-plug

" Install vim-plug if it has not yet been installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/rocketnova/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugins ------------------------------------------------
" Managed by vim-plug above
call plug#begin()

  " Set sensible default configs
  " Use <c-L> to clear highlighting
  " https://github.com/tpope/vim-sensible
  Plug 'tpope/vim-sensible'

  " Automatically adjust 'shiftwidth' and 'tabstop'
  " https://github.com/tpope/vim-sleuth
  Plug 'tpope/vim-sleuth'

  " Custom status line
  " https://github.com/vim-airline/vim-airline
  Plug 'vim-airline/vim-airline'

  " Sidebar file browser
  " Press <c-n> to display the nerdtree.
  " Show hidden files (i.e. starts with dot)
  " Use vim movement to navigate.
  " https://github.com/preservim/nerdtree
  Plug 'preservim/nerdtree'
  nnoremap <C-n> :NERDTreeToggle<CR>
  let NERDTreeShowHidden=1

  " Fuzzy-path finding with Ctrl-P
  " Press <F5> purge cache
  " Press <c-f> and <c-b> to cycle modes.
  " Press <c-d> to switch to filename only search instead of full path.
  " Press <c-r> to switch to regexp mode.
  " Use <c-j>, <c-k> or the arrow keys to navigate the result list.
  " Use <c-t> or <c-v>, <c-x> to open selected in a new tab or in a new split.
  " Use <c-n>, <c-p> to select next/previous string in the prompt's history.
  " Use <c-y> to create a new file and its parent directories.
  " Use <c-z> to mark/unmark multiple files and <c-o> to open them.
  " Show hidden dotfiles
  " https://github.com/ctrlpvim/ctrlp.vim
  Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_show_hidden=1

  " Install theme
  " https://github.com/NLKNguyen/papercolor-theme
  Plug 'NLKNguyen/papercolor-theme'

call plug#end()

" Remove trailing whitespace on :w ------------------------
" https://vim.fandom.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Colors & Fonts ------------------------------------------
syntax enable               " enable syntax processing
set encoding=utf8           " use utf8 as standard encoding
set background=dark
colorscheme PaperColor

" Spaces & Tabs -------------------------------------------
set tabstop=2               " number of visual spaces per TAB
set shiftwidth=2            " number of spaces to shift when using '>'
set softtabstop=2           " number of spaces in tab when editing
set expandtab               " tabs are spaces

" UI Config -----------------------------------------------
set number                  " show line numbers
set showcmd                 " show command in bottom bar
set cursorline              " highlight current line
filetype indent on          " load filetype-specific indent files
set lazyredraw              " redraw only when we need to.
set showmatch               " highlight matching [{()}]
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set ruler                   " show the cursor position all the time
set laststatus=2            " always show status line

" Wildmenu ------------------------------------------------
set wildmenu                " visual autocomplete for command menu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Searching -----------------------------------------------
set incsearch               " search as characters are entered
set hlsearch                " highlight matches
set ignorecase              " ignore case when searching

" Saving --------------------------------------------------
" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Invisible characters -----------------------------------
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" Prevent modeline vuln ----------------------------------
" https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
set nomodeline
