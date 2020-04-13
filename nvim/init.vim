call plug#begin('~/.vim/plugged')
Plug 'yuttie/comfortable-motion.vim'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
call plug#end()

" multiple file management
nmap <silent> <C-k> :wincmd k<cr>
nmap <silent> <C-j> :wincmd j<cr>
nmap <silent> <C-h> :wincmd h<cr>
nmap <silent> <C-l> :wincmd l<cr>
map <F2> :Texplore<cr>
map <F3> :Vexplore<cr>
map <F4> :Vexplore!<cr>

" theme
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
let g:gruvbox_invert_signs=1
let g:gruvbox_invert_selection=0
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE " disable background so Alacritty padding looks ok

" eliminate normal mode delay
set timeoutlen=1000 ttimeoutlen=0

" status and command line
set noshowmode   " hide mode indicator (-- INSERT --, etc)
set laststatus=2 " always show status bar
set wildmenu     " command completion
set showcmd      " show unfinished commands

" limits
set history=200    " increase undo history limit
set tabpagemax=100 " increase number of files that can be opened with -p

" editor
set number relativenumber " hybrid line numbers
set scrolloff=8           " number of lines from top after centering
set ai                    " auto indent
set lbr                   " word line wrap

" tab
set tabstop=4
set shiftwidth=4
set expandtab

" plugins
set updatetime=100 " lower updatetime for gitgutter

" w!! saves any file regardless of starting nvim with sudo
cmap w!! w !sudo tee > /dev/null %

" formats
autocmd FileType sh set expandtab!

" run custom scripts for various stuff
map <F5> :! ./run.sh "%"<cr>
map <F6> :! ./compile.sh "%"<cr>
map <F7> :! ./move.sh "%"<cr>
