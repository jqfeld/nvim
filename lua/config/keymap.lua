local wk = require("which-key")

P = function(x)
  print(vim.inspect(x))
  return (x)
end

RELOAD = function(...)
  return require 'plenary.reload'.reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

local nmap = function(key, effect)
  vim.keymap.set('n', key, effect, { silent = true, noremap = true })
end

local vmap = function(key, effect)
  vim.keymap.set('v', key, effect, { silent = true, noremap = true })
end

local imap = function(key, effect)
  vim.keymap.set('i', key, effect, { silent = true, noremap = true })
end


-- Resize window using <shift> arrow keys
nmap("<S-Up>", "<cmd>resize +2<CR>")
nmap("<S-Down>", "<cmd>resize -2<CR>")
nmap("<S-Left>", "<cmd>vertical resize -2<CR>")
nmap("<S-Right>", "<cmd>vertical resize +2<CR>")

-- Add undo break-points
imap(",", ",<c-g>u")
imap(".", ".<c-g>u")
imap(";", ";<c-g>u")

-- nmap('Q', '<Nop>')



-- keep selection after indent/dedent
vmap('>', '>gv')
vmap('<', '<gv')

-- remove search highlight on esc
nmap('<esc>', '<cmd>noh<cr>')

-- find files with telescope
nmap('<c-p>', "<cmd>Telescope find_files<cr>")

-- paste and without overwriting register
vmap("<leader>p", "\"_dP")

-- delete and without overwriting register
vmap("<leader>d", "\"_d")

-- center after search and jumps
nmap('n', "nzz")
nmap('<c-d>', '<c-d>zz')
nmap('<c-u>', '<c-u>zz')

-- move between splits and tabs
-- nmap('<c-h>', '<c-w>h')
-- nmap('<c-l>', '<c-w>l')
-- nmap('<c-j>', '<c-w>j')
-- nmap('<c-k>', '<c-w>k')
nmap('H', '<cmd>tabprevious<cr>')
nmap('L', '<cmd>tabnext<cr>')

local function toggle_light_dark_theme()
  if vim.o.background == 'light' then
    vim.o.background = 'dark'
    -- vim.cmd [[Catppuccin mocha]]
  else
    vim.o.background = 'light'
    -- vim.cmd [[Catppuccin latte]]
  end
end

--show keybindings with whichkey
--add your own here if you want them to
--show up in the popup as well
wk.register(
  {
    v = {
      name = 'vim',
      t = { toggle_light_dark_theme, 'switch theme' },
      c = { ':Telescope colorscheme<cr>', 'colortheme' },
      l = { ':Lazy<cr>', 'Lazy' },
      m = { ':Mason<cr>', 'Mason' },
      s = { ':e $MYVIMRC | :cd %:p:h <cr>', 'Settings' },
      h = { ':execute "h " . expand("<cword>")<cr>', 'help' }
    },
    l = {
      name = 'language/lsp',
      r    = { '<cmd>Telescope lsp_references<cr>', 'references' },
      R    = { 'rename' },
      D    = { vim.lsp.buf.type_definition, 'type definition' },
      a    = { vim.lsp.buf.code_action, 'code action' },
      e    = { vim.diagnostic.open_float, 'diagnostics' },
      f    = { vim.lsp.buf.format, 'format' },
      d    = {
        name = 'diagnostics',
        d = { vim.diagnostic.disable, 'disable' },
        e = { vim.diagnostic.enable, 'enable' },
      },
      g    = { ':Neogen<cr>', 'neogen docstring' },
      s    = { ':ls!<cr>', 'list all buffers' },
    },
    f = {
      name = 'find (telescope)',
      f = { '<cmd>Telescope find_files<cr>', 'files' },
      h = { '<cmd>Telescope help_tags<cr>', 'help' },
      k = { '<cmd>Telescope keymaps<cr>', 'keymaps' },
      r = { '<cmd>Telescope lsp_references<cr>', 'references' },
      g = { "<cmd>Telescope live_grep<cr>", "grep" },
      b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "fuzzy" },
      m = { "<cmd>Telescope marks<cr>", "marks" },
      M = { "<cmd>Telescope man_pages<cr>", "man pages" },
      c = { "<cmd>Telescope git_commits<cr>", "git commits" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "symbols" },
      d = { "<cmd>Telescope buffers<cr>", "buffers" },
      q = { "<cmd>Telescope quickfix<cr>", "quickfix" },
      l = { "<cmd>Telescope loclist<cr>", "loclist" },
      j = { "<cmd>Telescope jumplist<cr>", "marks" },
    },
    h = {
      name = 'help/debug/conceal',
      c = {
        name = 'conceal',
        h = { ':set conceallevel=1<cr>', 'hide/conceal' },
        s = { ':set conceallevel=0<cr>', 'show/unconceal' },
      },
      t = {
        name = 'treesitter',
        t = { vim.treesitter.inspect_tree, 'show tree' },
        c = { ':=vim.treesitter.get_captures_at_cursor()<cr>', 'show capture' },
        n = { ':=vim.treesitter.get_node():type()<cr>', 'show node' },
      }
    },
    g = {
      name = "git",
      g = { ":Neogit<cr>", "neogit" },
      wc = { ":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "worktree create" },
      ws = { ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "worktree switch" },
    },
  }, { mode = 'n', prefix = '<leader>' }

)

-- normal mode
wk.register({
  ['<esc>']         = { '<cmd>noh<cr>', 'remove search highlight' },
  ['n']             = { 'nzzzv', 'center search' },
  ['gN']            = { 'Nzzzv', 'center search' },
  ['gl']            = { '<c-]>', 'open help link' },
  ['gf']            = { ':e <cfile><CR>', 'edit file' },
  ['<m-i>']         = { 'o```{julia}<cr>```<esc>O', "julia code chunk" },
  ['<cm-i>']        = { 'o```{python}<cr>```<esc>O', "r code chunk" },
  ['<m-I>']         = { 'o```{python}<cr>```<esc>O', "r code chunk" },
  [']q']            = { ':silent cnext<cr>', 'quickfix next' },
  ['[q']            = { ':silent cprev<cr>', 'quickfix prev' },
}, { mode = 'n', silent = true })


-- visual mode
wk.register({
  ['<M-j>'] = { ":m'>+<cr>`<my`>mzgv`yo`z", 'move line down' },
  ['<M-k>'] = { ":m'<-2<cr>`>my`<mzgv`yo`z", 'move line up' },
  ['.'] = { ':norm .<cr>', 'repeat last normal mode command' },
  ['q'] = { ':norm @q<cr>', 'repeat q macro' },
}, { mode = 'v' })

wk.register({
  ['p'] = { '"_dP', 'replace without overwriting reg' },
}, { mode = 'v', prefix = "<leader>" })

wk.register({
  ['<m-m>'] = { ' |>', "pipe" },
  ['<m-i>'] = { '```{julia}<cr>```<esc>O', "julia code chunk" },
  ['<cm-i>'] = { '<esc>o```{python}<cr>```<esc>O', "r code chunk" },
  ['<m-I>'] = { '<esc>o```{python}<cr>```<esc>O', "r code chunk" },
}, { mode = 'i' })

wk.register(
  {
    b = { "<CMD>TexlabBuild<CR>", "Texlab build" },
    v = { "<CMD>TexlabForward<CR>", "Texlab forward search" }
  },
  { mode = "n", prefix = "<LocalLeader>" }
)
