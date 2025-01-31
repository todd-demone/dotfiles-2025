" VIMRC
" Author: Todd Demone
" Date: 2025-01-31

" vim-plug auto install
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'morhetz/gruvbox'
call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


" Indentation ---------------------------------------

set autoindent " New lines inherit the indentation of previous lines.
set softtabstop=4 " when pressing <Tab> or <Backspace>, insert (delete) 4 spaces (since expandtab is set)
set shiftwidth=4 " When pressing >> or << or using auto-indent, insert four spaces. (since expandtab is set)
set expandtab " Converts a press of <Tab>, >> or << or auto-indent to 4 spaces. The number of spaces is determined by "softtabstop" and "shiftwidth" set tabstop=8 " VISUAL ONLY; overridden by sts, sw and expandtab - When you press <Tab>, a tab character (\t) is inserted (unless expandtab is set). Vim doesn't actually insert 8 spaces in the document; it just makes the tab character visually appear like 8 spaces on the display. Even if using `expandtab` to insert spaces instead of a tab character, tabstop will still control the **visual** width of the indentation
set shiftround " When shifting lines, round the indentation to the nearest multiple of "shiftwidth."

filetype plugin indent on " Enable filetype-specific indentation, filetype-specific plugins, and filetype detection

" Search --------------------------------------------

set hlsearch " Enable search highlighting.
set ignorecase " Ignore case when searching.
set incsearch " Incremental search that shows partial matches.
set smartcase " Automatically switch search to case-sensitive when search query contains an uppercase letter.

" Text Rendering ------------------------------------

set display+=lastline " Always try to show a paragraph's last line.
set encoding=utf-8 " Use an encoding that supports unicode.
set linebreak " Avoid wrapping a line in the middle of a word.
set scrolloff=1 " The number of screen lines to keep above and below the cursor.
set sidescrolloff=5 " The number of screen columns to keep to the left and right of the cursor.
syntax enable " Enable syntax highlighting.
set wrap " Sets how text is displayed (wrapped); doesn't affect how the text is set in the buffer (see "textwidth")

" User Interface ------------------------------------

set laststatus=2 " Always display the status bar.
set ruler " Always show cursor position.
set wildmenu " Display command line's tab complete options as a menu.
set tabpagemax=50 " Maximum number of tab pages that can be opened from the command line.
let g:gruvbox_italic=1
set background=dark    " Setting dark mode for gruvbox
colorscheme gruvbox
set cursorline " Highlight the line currently under cursor.
set number " Show line numbers on the sidebar.
set relativenumber " Show line number on the current line and relative numbers on all other lines.
set noerrorbells " Disable beep on errors.
set visualbell " Flash the screen instead of beeping on errors.
set mouse=a " Enable mouse for scrolling and resizing.
set title " Set the window's title, reflecting the file currently being edited.
set showmatch " highlight matching [{()}] for C-like languages

" Code Folding Options -----------------------------

" set foldmethod=indent " Fold based on indention levels.
" set foldnestmax=3 " Only fold up to three nested levels.
" set nofoldenable " Disable folding by default.

" Miscellaneous Options ----------------------------

set backspace=indent,eol,start " Allow backspacing over indention, line breaks and insertion start.
" set backupdir=~/.cache/vim " Directory to store backup files.
set confirm " Display a confirmation dialog when closing an unsaved file.
" set dir=~/.cache/vim " Directory to store swap files.
set history=1000 " Increase the undo limit.
set noswapfile " Disable swap files.
set wildignore+=.pyc,.swp " Ignore files matching these patterns when opening files based on a glob pattern.
set splitbelow
set splitright
set path+=** " Search down into sub-folders; provides tab completion for all file-related tasks
autocmd! FileType help wincmd L " open help files to the right in a vertical split

" Macros -------------------------------------------

" Macro to insert date and time inside square brackets [YYYY-mm-dd hh:mm:ss]
let @t='i=strftime("%Y-%m-%d %T")€ýa'
" Macro to insert date inside square brackets [YYYY-mm-dd]
let @d='i=strftime("%Y-%m-%d")€ýa'

" Leader Key Mappings ------------------------------

" Map leader key to spacebar
let mapleader = " "

" Clear search highlighting
nnoremap <leader>h :set hlsearch!<CR>

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Map <Leader>t to open a terminal in a vertical split on the right

" Mappings - Other ---------------------------------
inoremap jj <Esc>
