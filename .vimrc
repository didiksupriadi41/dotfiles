" When started as "evim", evim.vim will already have done these settings.
  if v:progname =~? "evim"
    finish
  endif

" Bail out if something that ran earlier, e.g. a system wide vimrc, does not
" want Vim to use these default values.
  if exists('skip_defaults_vim')
    finish
  endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
  if &compatible
    set nocompatible
  endif

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
  silent! while 0
    set nocompatible
  silent! endwhile

  filetype off                  " required

" set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
  Plugin 'scrooloose/nerdtree'
  Plugin 'edkolev/promptline.vim'
  Plugin 'majutsushi/tagbar'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'tpope/vim-fugitive'
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'junegunn/fzf'
  Plugin 'vim-syntastic/syntastic'
  call vundle#end()            " required
  filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
  "filetype plugin on

" The default vimrc file.
"
" Individual settings can be reverted with ":set option&".
" Other commands can be reverted as mentioned below.

" Allow backspacing over everything in insert mode.
  set backspace=indent,eol,start

" keep 200 lines of command line history
  set history=200		
" show the cursor position all the time
  set ruler		
" display incomplete commands
  set showcmd		
" display completion matches in a status line
  set wildmenu		

" time out for key codes
  set ttimeout		
" wait up to 100ms after Esc for special key
  set ttimeoutlen=100	

" Show @@@ in the last line if it is truncated.
  set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
  set scrolloff=5

" Do incremental searching when it's possible to timeout.
  if has('reltime')
    set incsearch
  endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
  set nrformats-=octal

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
  if has('win32')
    set guioptions-=t
  endif

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
  map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
  inoremap <C-U> <C-G>u<C-U>

" Only do this part when Vim was compiled with the +eval feature.
  if 1

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
" Revert with ":filetype off".
    filetype plugin indent on

" Put these in an autocmd group, so that you can revert them with:
" ":augroup vimStartup | au! | augroup END"
    augroup vimStartup
      au!

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
      autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif

    augroup END

  endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
  if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
  endif

  if has('langmap') && exists('+langremap')
" Prevent that the langmap option applies to characters that result from a
" mapping.  If set (default), this may break plugins (but it's backward
" compatible).
    set nolangremap
  endif

" Airline
  let g:airline_theme='fairyfloss'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1

" Specific customization.
  set number
  set relativenumber
  set laststatus=2
  set noshowmode
  set t_Co=256
  set shiftwidth=4
  set tabstop=4
  set tw=78

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
  if &t_Co > 2 || has("gui_running")
" Revert with ":syntax off".
    syntax on

" I like highlighting strings inside C comments.
" Revert with ":unlet c_comment_strings".
    let c_comment_strings=1
  endif
