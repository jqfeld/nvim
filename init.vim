
" (N)Vim Configuration File
" " vim  : place in $HOME/.vimrc
" " nvim : place in $HOME/.config/nvim/init.vim
" " General settings
" "
" ---------------------------------------------------------------------------

let g:nvim_config_root = stdpath('config')
set mouse=a



"  " drop vi support - kept for vim compatibility but not needed for nvim
set nocompatible


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
" Style
call dein#add('morhetz/gruvbox')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('preservim/nerdtree')
call dein#add('ryanoasis/vim-devicons')

"
" Language support
call dein#add('neovim/nvim-lspconfig')
call dein#add('nvim-lua/completion-nvim')
call dein#add('nvim-lua/lsp_extensions.nvim')
call dein#add('rust-lang/rust.vim')
call dein#add('JuliaEditorSupport/julia-vim')
call dein#add('steelsojka/completion-buffers')

call dein#add('hkupty/iron.nvim')
call dein#add('preservim/nerdcommenter')

call dein#add('tpope/vim-fugitive')

" Required:
call dein#end()


" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

call map(dein#check_clean(), "delete(v:val, 'rf')")

"End dein Scripts-------------------------


"
"  " number of lines at the beginning and end of files checked for
"  file-specific vars
set modelines=0
"
"  " reload files changed outside of Vim not currently modified in Vim (needs
"  below)
set autoread
"
"  "
"  http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
au FocusGained,BufEnter * :silent! !
"
"  " use Unicode
set encoding=utf-8
"set fenc=utf-8
" set fencs=iso-2022-jp,euc-jp,cp932
"
"  " errors flash screen rather than emit beep
set visualbell
"
"  " make Backspace work like Delete
" set backspace=indent,eol,start
"
"  " don't create `filename~` backups
"  set nobackup
"
"  " don't create temp files
"  set noswapfile
"
"  " line numbers and distances
set relativenumber 
"  set number 
"
"  " number of lines offset when jumping
"  set scrolloff=2
"
"  " Tab key enters 2 spaces
"  " To enter a TAB character when `expandtab` is in effect,
"  " CTRL-v-TAB
set expandtab tabstop=2 shiftwidth=2 softtabstop=2 
"
"  " Indent new line the same as the preceding line
set autoindent
"
"  " statusline indicates insert or normal mode
set showmode showcmd
"
"  " make scrolling and painting fast
"  " ttyfast kept for vim compatibility but not needed for nvim
set ttyfast lazyredraw
"
"  " highlight matching parens, braces, brackets, etc
set showmatch
"
"  " http://vim.wikia.com/wiki/Searching
set hlsearch incsearch ignorecase smartcase
"
"  " As opposed to `wrap`
set nowrap
"
"  " http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
set autochdir
"
"  " open new buffers without saving current modifications (buffer remains
"  open)
set hidden
"
"  "
"  http://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu wildmode=list:longest,full
"
"  " StatusLine always visible, display full path
"  " http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
set laststatus=2 statusline=%F
"
"  " Use system clipboard
"  " http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamedplus
"
"  " Show character column
"  highlight ColorColumn ctermbg=DarkBlue
set colorcolumn=80
"
"  " CursorLine - sometimes autocmds are not performant; turn off if so
"  " http://vim.wikia.com/wiki/Highlight_current_line
set cursorline
"  " Normal mode
"  highlight CursorLine ctermbg=None
"  autocmd InsertEnter * highlight  CursorLine ctermbg=17 ctermfg=None
"  autocmd InsertLeave * highlight  CursorLine ctermbg=None ctermfg=None

"  " Split below and right
set splitbelow
set splitright


"  " Colors
"  "
"  ---------------------------------------------------------------------------
syntax enable
set background=dark
autocmd vimenter * ++nested colorscheme gruvbox
"  "
"  ---------------------------------------------------------------------------
"
"  Airline and tab bar
"  ---------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" NERDCommenter
let g:NERDCreateDefaultMappings = 1

"
" Autocompletion
autocmd BufEnter * lua require'completion'.on_attach()

let g:completion_enable_auto_popup = 1

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet', 'buffers']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]

" LSP configuration
" ----------------------------------------------------------------------------
exec 'luafile ' . g:nvim_config_root . '/lsp_config.lua'
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ 
\  prefix = '<==', 
\  highlight = "Comment", 
\  enabled = {"TypeHint", "ChainingHint", "ParameterHint"},
\  only_current_line = true
\  }

"  "Keymaps
"
let mapleader = " "
map <leader>h :noh<CR>

nmap <leader>1 :b1<CR>
nmap <leader>2 :b2<CR>
nmap <leader>3 :b3<CR>
nmap <leader>4 :b4<CR>
nmap <leader>5 :b5<CR>
nmap <leader>6 :b6<CR>
nmap <leader><TAB> :bn<CR>

noremap <leader>s :split\|term<CR>i
tnoremap <leader>q <C-\><C-n> :q<CR>
tnoremap <Esc> <C-\><C-n>

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

exec 'luafile ' . g:nvim_config_root . '/plugins.lua'
