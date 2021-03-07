
" (N)Vim Configuration File
" " vim  : place in $HOME/.vimrc
" " nvim : place in $HOME/.config/nvim/init.vim
" " General settings
" "
" ---------------------------------------------------------------------------

let g:nvim_config_root = stdpath('config')
set mouse=a

lua require('plugins')
lua require('lsp_config')
lua require('plugin_settings')

"" Behaviour
"  " drop vi support - kept for vim compatibility but not needed for nvim
set nocompatible

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
    \{'complete_items': ['lsp', 'path','snippet', 'buffers']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]

"" Style
"" -------------------------
set background=dark " or light if you want light mode
colorscheme gruvbox

set colorcolumn=80
set cursorline
set showmode showcmd
set relativenumber 

lua require('lualine').status()
set termguicolors

""autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
""\ lua require'lsp_extensions'.inlay_hints{ 
""\  prefix = '<==', 
""\  highlight = "Comment", 
""\  enabled = {"TypeHint", "ChainingHint", "ParameterHint"},
""\  only_current_line = true
""\  }

"" Keymaps
"" -------------------------
"" quick reload of init.vim
let mapleader = " "
nmap <leader>fvd  :e $MYVIMRC<CR>
nmap <leader>fvr  :source $MYVIMRC<CR>
map <leader>h :noh<CR>

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
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"" NvimTree
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen and NvimTreeClose are also available if you need them
"
"
"" Dashboard
let g:dashboard_default_executive ='telescope'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

"" Neuron, not shure why necessary...
 " click enter on [[my_link]] or [[[my_link]]] to enter it
nnoremap <buffer> <CR> <cmd>lua require'neuron'.enter_link()<CR>
" create a new note
nnoremap <buffer> gzn <cmd>lua require'neuron/cmd'.new_edit(require'neuron'.config.neuron_dir)<CR>
" find your notes, click enter to create the note if there are not notes that match
nnoremap <buffer> gzz <cmd>lua require'neuron/telescope'.find_zettels()<CR>
" insert the id of the note that is found
nnoremap <buffer> gzZ <cmd>lua require'neuron/telescope'.find_zettels {insert = true}<CR>
" find the backlinks of the current note all the note that link this note
nnoremap <buffer> gzb <cmd>lua require'neuron/telescope'.find_backlinks()<CR>
" same as above but insert the found id
nnoremap <buffer> gzB <cmd>lua require'neuron/telescope'.find_backlinks {insert = true}<CR>
" find all tags and insert
nnoremap <buffer> gzt <cmd>lua require'neuron/telescope'.find_tags()<CR>
" start the neuron server and render markdown, auto reload on save
nnoremap <buffer> gzs <cmd>lua require'neuron'.rib {address = "127.0.0.1:8200", verbose = true}<CR>
" go to next [[my_link]] or [[[my_link]]]
nnoremap <buffer> gz] <cmd>lua require'neuron'.goto_next_extmark()<CR>
" go to previous
nnoremap <buffer> gz[ <cmd>lua require'neuron'.goto_prev_extmark()<CR>]]
