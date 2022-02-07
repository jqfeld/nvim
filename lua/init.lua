P = function(v)
    print(vim.inspect(v))
    return v
end

if pcall(require, 'plenary') then
    RELOAD = require('plenary.reload').reload_module
    R = function(name)
        RELOAD(name)
        return require(name)
    end
end

local opt = vim.opt
-- "" Behaviour
-- "  " drop vi support - kept for vim compatibility but not needed for nvim
-- set nocompatible

-- set noswapfile
-- "  " reload files changed outside of Vim not currently modified in Vim (needs
-- "  below)
-- "  http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
-- set autoread
opt.swapfile = false
opt.autoread = true
opt.number = true
-- au FocusGained,BufEnter * :silent! !
--
--
-- set encoding=utf-8
--
-- set visualbell
--
-- set expandtab tabstop=4 shiftwidth=4 softtabstop=4 
-- set smartindent
--
-- set ttyfast lazyredraw
-- set showmatch
-- set hlsearch incsearch ignorecase smartcase
-- set nowrap
-- set autochdir
-- set hidden
-- set inccommand=split
--
-- " Use system clipboard
-- set clipboard=unnamedplus
--
-- set splitbelow
-- set splitright
--
-- " Autocompletion
-- " Set completeopt to have a better completion experience
-- " set completeopt=menuone,noselect
-- set completeopt=menu,menuone,noselect,noinsert
-- " Avoid showing message extra message when using completion
-- set shortmess+=c
--
