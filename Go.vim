"  _____       _   _ _           
" |  __ \     | | | (_)          
" | |  \/ ___ | | | |_ _ __ ___  
" | | __ / _ \| | | | | '_ ` _ \ 
" | |_\ \ (_) \ \_/ / | | | | | |
"  \____/\___/ \___/|_|_| |_| |_|
"
" ---------------------------------------------------------------------------
" Welcome to GoVim! This is a minimalistic Vim configuration that 
" is designed to be used to program in Golang, formally known as Go.
" You are free to modify your own copy of GoVim however you'd like. But if
" it were to be distributed, you must mention that your product is a fork
" of GoVim, how else would i gain my popularity?
" ---------------------------------------------------------------------------
" Before you get this ready for use, there are a few things that you need to
" configure. This guide assumes that you already have Golang and Git 
" installed on your machine, and have decent knowledge about using Vim.
" ---------------------------------------------------------------------------
" 1: You need to set the PLUGIN_PATH on line 63, which is just the directory 
" where you want to load the plugins into, it can be anywhere.
" ---------------------------------------------------------------------------
" 2: You need to install NodeJS, CoC (Conqueror of Completion) runs on Node,
" so you will need it to continue.
" https://nodejs.org/en/download
" ---------------------------------------------------------------------------
" 3: Install VimPlug, this VIMRC uses VimPlug as it's package manager, so in
" order to install all of the packages, you will need to get that up and
" running.
" https://github.com/junegunn/vim-plug
" ---------------------------------------------------------------------------
" 4: Install all of the plugins by running `:PlugInstall` and refreshing
" Vim by pressing CTRL-R.
" ---------------------------------------------------------------------------
" 5: Install the Vim-Go dependencies with `:GoInstallBinaries`.
" ---------------------------------------------------------------------------
" 6: Install the Golang autocompletion engine, run `:CocInstall coc-go`.
" ---------------------------------------------------------------------------
" 7: Install a Nerd Font, this will let you properly render the powerline
" glyphs and dev icons. Don't forget to add the font into your terminal.
" https://github.com/ryanoasis/nerd-fonts#patched-fonts
" ---------------------------------------------------------------------------
" 8: Enjoy :)
" ---------------------------------------------------------------------------

autocmd vimenter * tabnew 
autocmd vimenter * :q


" General Settings:
syntax on " enable syntax highlighting if it wasn't already on
set nu " enable line numbers
set mouse=a " enable mouse support 
set relativenumber " set relative numbers on the line numbers
set cursorline " highlight current line
set autoindent " automatically create tabs when appropriate
set noshowmode " hide the default status line
set encoding=UTF-8 " set the proper font encoding
set noswapfile " ignore swap files
set shiftwidth=3 tabstop=3 " set tab size to be 3 spaces large
set colorcolumn=120 " create text wrap border

" if colors are not working out properly, toggle this setting
set termguicolors 

" Variables:
let PLUGIN_PATH = '~/AppData/Local/nvim/plugins'

" Functions:

" Plugins:
call plug#begin(PLUGIN_PATH)

Plug 'vim-airline/vim-airline' " a cool status line
Plug 'vim-airline/vim-airline-themes' " airline colorthemes

Plug 'dracula/vim' " dracula colortheme
Plug 'morhetz/gruvbox' " gruvbox colortheme
Plug 'joshdick/onedark.vim' " one-dark colortheme
Plug 'arcticicestudio/nord-vim' " nord colortheme
Plug 'junegunn/seoul256.vim' " seoul256 colortheme
Plug 'nlknguyen/papercolor-theme' " papercolor colortheme

Plug 'fatih/vim-go' " golang support
Plug 'neoclide/coc.nvim' " autocompletion engine

Plug 'tmsvg/pear-tree' " auto quote, parentheses, etc

Plug 'junegunn/fzf' " fuzzy file explorer
Plug 'scrooloose/nerdtree' " tree file explorer
Plug 'ryanoasis/vim-devicons' " file icons

call plug#end()

" Key Maps:

" CTRL-R will reload the vimrc
nnoremap <C-r> :source % <cr> 

" CTRL-N will toggle nerdtree
nnoremap <C-n> :NERDTreeToggle <cr>

" CTRL-G will run the Golang project in the src directory, which is located in
" the root project folder
nnoremap <C-g> :!go run ./src <cr>

" CTRL-F will toggle the FZF fuzzy finder
nnoremap <C-f> :FZF <cr>

" SHIFT-N will reload the nerdtree root directory
nnoremap <S-n> :NERDTreeRefreshRoot <cr>

" CTRL-T will automatically enter 'tabedit' in the commandline and let you
" type in the filename of the file to edit
nnoremap <C-t> :tabedit


" Plugin Configurations:

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" nerdtree
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Customization:

colorscheme gruvbox
let g:airline_theme = 'gruvbox'

