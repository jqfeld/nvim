" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "C:\\Users\\janku\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\janku\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\janku\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\janku\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\janku\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\barbar.nvim"
  },
  ["completion-buffers"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\completion-buffers"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\completion-nvim"
  },
  ["csv.vim"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\csv.vim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\dashboard-nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gruvbox.nvim"
  },
  ["iron.nvim"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\iron.nvim"
  },
  ["julia-vim"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\julia-vim"
  },
  kommentary = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\kommentary"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp_extensions.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lush.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\markdown-preview.nvim"
  },
  neogit = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neogit"
  },
  ["neuron.nvim"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neuron.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nlua.nvim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\popup.nvim"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\rust.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim"
  },
  vimtex = {
    loaded = true,
    path = "C:\\Users\\janku\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vimtex"
  }
}


-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
