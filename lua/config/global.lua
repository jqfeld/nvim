
-- proper colors
vim.opt.termguicolors = true

-- more opinionated
vim.opt.number = true                  -- show linenumbers
vim.opt.relativenumber = true
vim.opt.mouse = 'a'                    -- enable mouse
vim.opt.mousefocus = true
vim.opt.clipboard:append 'unnamedplus' -- use system clipboard
-- vim.opt.textwidth = 79
vim.opt.colorcolumn = {80,}
vim.opt.wrap = false
 
vim.opt.timeoutlen = 400               -- until which-key pops up
vim.opt.updatetime = 250               -- for autocommands and hovers

-- don't ask about existing swap files
vim.opt.shortmess:append 'A'

-- use spaces as tabs
local tabsize = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = tabsize
vim.opt.tabstop = tabsize

-- space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- smarter search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indent
vim.opt.smartindent = true
vim.opt.breakindent = true

-- consistent number column
vim.opt.signcolumn = "yes:1"

-- how to show autocomplete menu
vim.opt.completeopt = 'menuone,noselect,noinsert'

-- add folds with treesitter grammar
vim.opt.foldmethod = "expr"
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- but open all by default
vim.opt.foldlevel = 99

-- global statusline
vim.opt.laststatus = 3

-- split right and below by default
vim.opt.splitright = true
vim.opt.splitbelow = true

--tabline
vim.opt.showtabline = 1

--windowline
vim.opt.winbar = '%f'

--don't continue comments automagically
vim.opt.formatoptions:remove({ 'c', 'r', 'o' })

-- hide cmdline when not used
vim.opt.cmdheight = 0

-- scroll before end of window
vim.opt.scrolloff = 5

-- auto change the cwd to current buffer
vim.opt.autochdir = false

vim.g.tex_flavor = "latex"

-- activate spell checking for English and German
vim.opt.spell = true
vim.opt.spelllang = "en,de"

-- Save localoptions to session file
vim.opt.sessionoptions:append("localoptions")       

-- cursorline
vim.opt.cursorline = true


