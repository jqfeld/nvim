
" (N)Vim Configuration File
" " vim  : place in $HOME/.vimrc
" " nvim : place in $HOME/.config/nvim/init.vim
" " General settings
" "
" ---------------------------------------------------------------------------
"  " drop vi support - kept for vim compatibility but not needed for nvim
set nocompatible

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=C:\Users\janku\.cache\dein\repos\github.com\Shougo\dein.vim

" Required:
call dein#begin('C:\Users\janku\.cache\dein')

" Let dein manage dein
" Required:
call dein#add('C:\Users\janku\.cache\dein\repos\github.com\Shougo\dein.vim')

" Add or remove your plugins here like this:
" Style
call dein#add('morhetz/gruvbox')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('preservim/nerdtree')
"
" Language support
call dein#add('neovim/nvim-lspconfig')
call dein#add('rust-lang/rust.vim')
call dein#add('JuliaEditorSupport/julia-vim')

call dein#add('preservim/nerdcommenter')

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
set fenc=utf-8
set fencs=iso-2022-jp,euc-jp,cp932
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

" LSP configuration
" ----------------------------------------------------------------------------
lua << EOF

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
-- local servers = {"rust-analyzer", "julials"}
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup { on_attach = on_attach }
-- end

nvim_lsp.rust_analyzer.setup{
  on_attach = on_attach
}

nvim_lsp.julials.setup{
  on_attach = on_attach
}

EOF



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

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

