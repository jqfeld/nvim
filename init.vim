
" (N)Vim Configurtion File
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
set smartindent

set ttyfast lazyredraw
set showmatch
set hlsearch incsearch ignorecase smartcase
set nowrap
set autochdir
set hidden
set inccommand=split

" Use system clipboard
set clipboard=unnamedplus

set splitbelow
set splitright

" Autocompletion
" Set completeopt to have a better completion experience
" set completeopt=menuone,noselect
set completeopt=menu,menuone,noselect,noinsert
" Avoid showing message extra message when using completion
set shortmess+=c

if has('win32')
    set shell=powershell
    let g:vimtex_view_general_viewer = 'mupdf'
endif

if has('unix')
    let g:vimtex_view_general_viewer = 'zathura'
endif


" Recognize handlebar and tera templates as html
augroup HTMLTemplates
    autocmd!
    autocmd BufReadPre,FileReadPre *.hbs set ft=html
    autocmd BufReadPre,FileReadPre *.tera set ft=html
augroup END

"" Style
"" -------------------------
set background=light " or light if you want light mode
let g:gruvbox_material_enable_italic = 1
colorscheme gruvbox-material

set termguicolors

" set colorcolumn=80
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

nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

nnoremap <C-A-J> <C-W>J
nnoremap <C-A-K> <C-W>K
nnoremap <C-A-L> <C-W>L
nnoremap <C-A-H> <C-W>H


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
" nnoremap <leader>fe <cmd>lua require("telescope.builtin").file_browser()<cr>
nnoremap <leader>fe <cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>
nnoremap <leader>fb <cmd>lua require("telescope.builtin").buffers()<cr>
nnoremap <leader>fH <cmd>lua require("telescope.builtin").help_tags()<cr>
nnoremap <leader>ft <cmd>lua require("telescope.builtin").treesitter()<cr>
nnoremap <leader>fg <cmd>lua require("telescope.builtin").git_files()<cr>
nnoremap <leader>fP <cmd>lua require("telescope.builtin").find_files({cwd="~/.local/share/nvim/site/pack/packer/start"})<cr>
nnoremap <leader>fh <cmd>lua require("telescope.builtin").find_files({cwd="~/"})<cr>
nnoremap <leader>ff <cmd>lua require("telescope.builtin").find_files()<cr>
nnoremap <leader>fp <cmd>lua require("telescope.builtin").find_files({cwd="~/projects"})<cr>


"
"" Dashboard
let g:dashboard_default_executive ='telescope'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fv :DashboardFindHistory<CR>
" nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
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


" Neogit
nnoremap <silent> <Leader>gg <cmd>lua require'neogit'.status.create('tab')<CR>

" Todo-comments
nnoremap <silent> <Leader>fT :TodoTelescope <CR>
nnoremap <silent> <Leader>tf :TodoQuickFix <CR>

" FTerm
nnoremap <silent> <A-i> <CMD>lua require'FTerm'.toggle()<CR>
tnoremap <silent> <A-i> <C-\><C-n><CMD>lua require'FTerm'.toggle()<CR>

"" NNN
lua R('FTerm-nnn').setup({env="ICONLOOKUP=1"})
nnoremap <LEADER>nn <CMD>lua require("FTerm-nnn").nnn_toggle()<CR>
nnoremap <LEADER>nv <CMD>lua require("FTerm-nnn").nnn_vs_toggle()<CR>
nnoremap <LEADER>nh <CMD>lua require("FTerm-nnn").nnn_hs_toggle()<CR>
" tnoremap <C-A-n> <cmd>NnnExplorer<CR>
" nnoremap <C-A-n> <cmd>NnnExplorer %:p:h<CR>
" tnoremap <C-A-p> <cmd>NnnPicker<CR>
" nnoremap <C-A-p> <cmd>NnnPicker<CR>

" Watson keybinds
nnoremap <silent> <Leader>wd :lua R('watson'); require('watson').find_data()<CR>
nnoremap <silent> <Leader>wD :lua R('watson'); require('watson').find_data({insert=false})<CR>
nnoremap <silent> <Leader>ws :lua R('watson'); require('watson').find_in('scriptsdir',{insert=false})<CR>
nnoremap <silent> <Leader>wS :lua R('watson'); require('watson').find_in('scriptsdir',{insert=true})<CR>
nnoremap <silent> <Leader>wp :lua R('watson'); require('watson').find_plot()<CR>
nnoremap <silent> <Leader>wP :lua R('watson'); require('watson').find_in('projectdir',{insert=false})<CR>
nnoremap <silent> <Leader>wn :lua R('watson'); require('watson').find_notes()<CR>
" nnoremap <silent> <Leader>wp :lua R('watson'); require('watson').find_and_open({open_command="zathura", cwd=require('watson/utils').plots_dir()})<CR>

" Neorg keybinds
nnoremap <silent> <Leader>og :Neorg workspace gtd<CR>
nnoremap <silent> <Leader>ow :Neorg workspace work<CR>
nnoremap <silent> <Leader>op :Neorg workspace main<CR>

" Table mode
nnoremap <silent> <Leader>mt :TableModeToggle<CR>

" Luasnip
imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'
inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(1)<CR>
snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>

" todo.txt
nnoremap <silent> <Leader>ta <cmd>lua R('todotxt'); require('todotxt').todo_prompt()<CR>
