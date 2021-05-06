-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- auto install packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

return require('packer').startup{function(use)
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim'}


    -- Syle plugins
    use { "npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    use { "kyazdani42/nvim-web-devicons" }
    use { "romgrk/barbar.nvim", requires = {"kyazdani42/nvim-web-devicons"}}
    use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function()
      require('lualine').setup{
        options = {
          theme = 'gruvbox',
          section_separators = {'', ''},
          component_separators = {'', ''},
          icons_enabled = true,
        },
        sections = {
          lualine_a = { {'mode', upper = true} },
          lualine_b = { {'branch', icon = ''} },
          lualine_c = { {'filename', file_status = true} },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location'  },
        },
        inactive_sections = {
          lualine_a = {  },
          lualine_b = {  },
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {  },
          lualine_z = {   }
        },
        extensions = { 'chadtree' },
      }
    end
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {
        'glepnir/dashboard-nvim',
        requires = {'nvim-telescope/telescope.nvim'}
    }
    --[[ use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'}
    } ]]

    use { 'ms-jpq/chadtree', run = ':CHADdeps' }

    -- Language support plugins
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'neovim/nvim-lspconfig' }
    use { 'nvim-lua/lsp_extensions.nvim' }
    use { 'nvim-lua/completion-nvim' }
    use { 'steelsojka/completion-buffers' }
    use { 'glepnir/lspsaga.nvim' }
    use { 'b3nj5m1n/kommentary' }

    -- Rust
    use { 'rust-lang/rust.vim' }

    -- Julia
    use { 'JuliaEditorSupport/julia-vim' }
    use { 'hkupty/iron.nvim' }


    -- CSV
    use { 'chrisbra/csv.vim' }

    -- Git
    use { 'TimUntersberger/neogit' }

    -- LaTeX
    use { 'lervag/vimtex' }

    -- Lua
    --use { 'tjdevries/nlua.nvim' }

    -- Neuron / Note taking
    --[[ use { 
        "oberblastmeister/neuron.nvim",
        requires = {{'nvim-lua/plenary.nvim'}, {'nvim-lua/popup.nvim'},
                    {'nvim-telescope/telescope.nvim'}},
        branch = "unstable",
        } ]]

    use { 
        "jqfeld/neuron.nvim",
        requires = {{'nvim-lua/plenary.nvim'}, {'nvim-lua/popup.nvim'},
                    {'nvim-telescope/telescope.nvim'}},
        branch = "win_compat",
        }


end}

