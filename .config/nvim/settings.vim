" colorscheme
"let g:tokyonight_style = "night"
"colorscheme tokyonight
"colorscheme nord

" file type plugin on for nerd commenter
filetype plugin on

" set leader key
let g:mapleader = "\<Space>"

" ranger hijack
let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1

syntax enable                           " Enables syntax highlighing
" set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler                               " Show the cursor position all the time
" set cmdheight=1                         " More space for displaying messages
set iskeyword+=-                        " treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=2                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number relativenumber               " Line numbers
" set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard+=unnamedplus              " Copy paste between vim and everything else
set noshowcmd  " ------------------------ to get rid of display of last command
set shortmess+=F  " to get rid of the file name displayed in the command line bar
set autochdir                           " Your working directory will always be the same as your working directory
" set number                              " Set line number



au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %

" Autocomment new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" don't show line number
autocmd TermOpen * setlocal nonumber norelativenumber

" Split
set splitbelow
set splitright
hi VertSplit cterm=NONE ctermfg=8 ctermbg=NONE guibg=NONE guifg=#3c414c

set laststatus=2
" Hide mode
set noshowmode

" Folding
set foldmethod=indent
set foldnestmax=10
set foldlevel=2
set nofoldenable

" Spaces & Tabs {{{
set smartindent
function! UseTabs()
  set tabstop=4     " Size of a hard tabstop (ts).
  set shiftwidth=4  " Size of an indentation (sw).
  set noexpandtab   " Always uses tabs instead of space characters (noet).
  set autoindent    " Copy indent from current line when starting a new line (ai).
endfunction

function! UseSpaces()
  set tabstop=4     " Size of a hard tabstop (ts).
  set shiftwidth=4  " Size of an indentation (sw).
  set expandtab     " Always uses spaces instead of tab characters (et).
  set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
  set autoindent    " Copy indent from current line when starting a new line.
  set smarttab      " Inserts blanks on a <Tab> key (as per sw, ts and sts).
endfunction

call UseSpaces()

" Sessions
"autocmd VimLeave * NERDTreeClose
" autocmd VimLeave * mks! ~/.config/nvim/.sessions/last.vim
autocmd vimenter * silent! lcd %:p:h
autocmd BufEnter NvimTree set cursorline

" Settings for ctrl-space
set nocompatible
set hidden

" Keep 3 lines below and above the cursor
set scrolloff=3 

" Colors
highlight StartifyHeader  ctermfg=2 guifg=#59B7BB
highlight StartifySection  ctermfg=1 guifg=#59B7BB
highlight StartifyFile ctermfg=5 guifg=#447CA7

" set shortmess-=S

"Colors"
set termguicolors
"set t_Co=256
syntax enable

"Goyo & Limelight
let g:goyo_width=130
"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  "set scrolloff=999
  "Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  "set scrolloff=5
  "Limelight!
  " ...
endfunction

" autocmd! User GoyoEnter nested call <SID>goyo_enter()
" autocmd! User GoyoLeave nested call <SID>goyo_leave()

" let g:limelight_conceal_ctermfg = 'gray'
" let g:limelight_conceal_ctermfg = 240
" let g:limelight_default_coefficient = 0.7

let g:material_terminal_italics = 1


"save all buffers when vim loses focus
au FocusLost * silent! wa

"autosave all files when a buffer is closed
set autowriteall

"set title to file being edited
set title titlestring=\ nvim\ -\ %t\ %M

" emmet 

