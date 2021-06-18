
" (N)Vim Configuration File
" " vim  : place in $HOME/.vimrc
" " nvim : place in $HOME/.config/nvim/init.vim
" " General settings
" "
" ---------------------------------------------------------------------------

let g:nvim_config_root = stdpath('config')
set mouse=a

lua require('init')
lua R('plugins')
lua R('lsp_config')
lua R('plugin_settings')

"" Behaviour
"  " drop vi support - kept for vim compatibility but not needed for nvim
set nocompatible

set noswapfile
"  " reload files changed outside of Vim not currently modified in Vim (needs
"  below)
"  http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
set autoread
au FocusGained,BufEnter * :silent! !


set encoding=utf-8

set visualbell

set expandtab tabstop=4 shiftwidth=4 softtabstop=4 
set autoindent

set ttyfast lazyredraw
set showmatch
set hlsearch incsearch ignorecase smartcase
set nowrap
set autochdir
set hidden

" Use system clipboard
set clipboard=unnamedplus

set splitbelow
set splitright

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
    \{'complete_items': ['lsp', 'path','snippet']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]

if has('win32')
    set shell=powershell
    let g:vimtex_view_general_viewer = 'mupdf'
endif

if has('unix')
    let g:vimtex_view_general_viewer = 'zathura'
endif

"" Style
"" -------------------------
set background=dark " or light if you want light mode
colorscheme gruvbox

set termguicolors

set colorcolumn=80
set cursorline
set showmode showcmd
set number "relativenumber 



"" Keymaps
"" -------------------------
"" quick reload of init.vim
let mapleader = " "
nmap <leader>fcd  :e $MYVIMRC<CR>
nmap <leader>fcr  :source $MYVIMRC<CR>
map <leader>h :noh<CR>
tnoremap <Esc> <C-\><C-n>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"" barbar.nvim
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
nnoremap <silent>    <A-c> :BufferClose<CR>

"" Telescope.nvim
nnoremap <leader>fe <cmd>lua require("telescope.builtin").file_browser()<cr>
nnoremap <leader>fb <cmd>lua require("telescope.builtin").buffers()<cr>
nnoremap <leader>fh <cmd>lua require("telescope.builtin").help_tags()<cr>
nnoremap <leader>ft <cmd>lua require("telescope.builtin").treesitter()<cr>
nnoremap <leader>fg <cmd>lua require("telescope.builtin").git_files()<cr>
nnoremap <leader>fp <cmd>lua require("telescope.builtin").find_files({cwd="~/.local/share/nvim/site/pack/packer/start"})<cr>

"" NvimTree
let g:nvim_tree_hide_dotfiles = 1
let g:nvim_tree_disable_netrw = 0
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>


"
"" Dashboard
let g:dashboard_default_executive ='telescope'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fv :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fB :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
let g:dashboard_custom_shortcut={
      \ 'last_session'       : 'SPC s l',
      \ 'find_history'       : 'SPC f v',
      \ 'find_file'          : 'SPC f f',
      \ 'change_colorscheme' : 'SPC t c',
      \ 'find_word'          : 'SPC f a',
      \ 'book_marks'         : 'SPC f B',
      \ 'new_file'           : 'SPC c n',
      \ }

" nnoremap <silent> <Leader>gz :e ~/Dropbox/neuron/index.md<CR>

" Neogit
nnoremap <silent> <Leader>gg <cmd>lua require'neogit'.status.create('tab')<CR>

" Todo-comments
nnoremap <silent> <Leader>tt :TodoTelescope <CR>
nnoremap <silent> <Leader>tf :TodoQuickFix <CR>

" FTerm
nnoremap <silent> <A-i> <CMD>lua require'FTerm'.toggle()<CR>
tnoremap <silent> <A-i> <C-\><C-n><CMD>lua require'FTerm'.toggle()<CR>

" Watson keybinds
nnoremap <silent> <Leader>wd :lua R('watson'); require('watson').find_data()<CR>
