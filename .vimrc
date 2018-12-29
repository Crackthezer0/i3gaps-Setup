set t_Co=256
syntax on
"set synmaxcol=512
set number
colors Tomorrow-Night-Eighties
map <C-n> :NERDTreeToggle<CR>
nmap <C-...> <Space>
let mapleader = ","
let maplocalleader="\<space>"
execute pathogen#infect()
filetype plugin indent on
set nocompatible 
let g:airline_powerline_fonts = 1
set ttimeoutlen=40
