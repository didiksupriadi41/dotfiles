" Initialize defaults
  source $VIMRUNTIME/defaults.vim

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
  Plugin 'tpope/vim-commentary'
  call vundle#end()            " required
  filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
  "filetype plugin on

" Airline
  let g:airline_theme='fairyfloss'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#ycm#enabled = 1

" Specific customization.
  " set number
  " set relativenumber
  set laststatus=2
  set noshowmode
  set t_Co=256
  set shiftwidth=4
  set tabstop=4
