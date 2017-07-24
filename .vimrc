"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.


" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
set smarttab

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
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

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
" set mouse=a

" Display line numbers on the left
set number
nnoremap <F2> :set nonumber!<CR>

" Use <F2> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F4>

" This is to help with ruby issues
set re=1

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.

" Whitespace

set nowrap

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap s<ilent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-x> :nohl<CR>

" Map tab navigation to left and right bracket
nnoremap . :tabnext<CR>
nnoremap , :tabprev<CR>

" New tab with Ctrl-t
nnoremap <C-t>     :tabe<Space>
inoremap <C-t>    <Esc>:tabe<Space>

"nerd tree mapping
map <C-n> <plug>NERDTreeTabsToggle<CR>
"------------------------------------------------------------
" Set the color scheme

color desert

"-----------------------------------------------------------
" Detect modified files (useful for git and such)
set autoread
"-----------------------------------------------------------
" Sane plugin loading (plugin)
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" vim plugins!
Bundle 'tpope/vim-fugitive'
Bundle 'vim-airline/vim-airline'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'Valloric/YouCompleteMe'
Bundle 'junegunn/fzf.vim'
Bundle 'tpope/vim-commentary'
Bundle 'xolox/vim-easytags'
Bundle 'tpope/vim-eunuch'
Bundle 'airblade/vim-gitgutter'
Bundle 'szw/vim-maximizer'
Bundle 'xolox/vim-misc'
Bundle 'jistr/vim-nerdtree-tabs'

"-----------------------------------------------------------
"fzf integration
command! -nargs=1 Locate call fzf#run(
      \ {'source': 'locate <q-args>', 'sink': 'e', 'options': '-m'})

set rtp+=~/.fzf
let g:fzf_layout = { 'down': '~40%' }

"-----------------------------------------------------------
"fzf integration
nnoremap <C-f> :MaximizerToggle<CR>
vnoremap <C-f> :MaximizerToggle<CR>gv
inoremap <C-f> <C-o>:MaximizerToggle<CR>


"----------------------------------------------------------
"silver searcher integration
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'                                                   
  cnoreabbrev ag Ack                                                                           
  cnoreabbrev aG Ack                                                                           
  cnoreabbrev Ag Ack                                                                           
  cnoreabbrev AG Ack  
endif
"----------------------------------------------------------
"you complete me settings
" turn off YCM
nnoremap <leader>y :let g:ycm_auto_trigger=-1<CR>                
"turn on YCM
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>
"close syntax window"
nnoremap <C-c> :lclose<CR> 
"
"" YouCompleteMe options
"
"
"let g:ycm_register_as_syntastic_checker = 1 "default 1
"let g:Show_diagnostics_ui = 1 "default 1
"
""will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
""highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
" let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_autoclose_preview_window_after_insertion = 1

let g:clang_complete_macros = 1

let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''


let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info


" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 1


let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'


nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>

"close YCM preview window after completion
" let g:ycm_autoclose_preview_window_after_completion=1
"----------------------------------------------------------
"setting tags
set tags=./tags;
nnoremap <C-]> <C-w><C-]><C-w>T

"----------------------------------------------------------
" Misc
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

"----------------------------------------------------------
" Fix session saving
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
