
vim.cmd.colorscheme 'kanagawa'


-- vim.cmd.colorscheme 'catppuccin'
-- local colors = require('catppuccin.palettes.latte')
-- vim.api.nvim_set_hl(0, 'Tabline', { fg = colors.green, bg = colors.mantle })
-- vim.api.nvim_set_hl(0, 'TermCursor', { fg = '#A6E3A1', bg = '#A6E3A1' })

vim.o.termguicolors = true
vim.o.background = "dark"

-- vim.g.gruvbox_material_background = 'hard'
-- vim.cmd.colorscheme 'gruvbox-material'


vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]
