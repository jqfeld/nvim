-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- auto install packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

-- HACK: Some problems with packer during first start of neovim -> uncomment this
-- after plugins are installed display can be set interactive again
--[[ require('packer').init({
    display = {
        non_interactive = true,
    }
}) ]]

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

    use {
      "folke/todo-comments.nvim",
      config = function()
        require("todo-comments").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    use { 'yamatsum/nvim-cursorline',
        config = function()
            vim.g.cursorword_highlight = 1
        end
    }

    -- use { 'kyazdani42/nvim-tree.lua' }

    use {
        "jqfeld/FTerm.nvim",
        config = function()
            require("FTerm").setup({
                dimensions = {
                    height = 0.8,
                    width = 0.8,
                    x = 0.5,
                    y = 0.5
                },
                border = 'single'
            })
        end
    }

    use {
        "jqfeld/FTerm-nnn.nvim",
        requires = { "jqfeld/FTerm.nvim" }
    }

    -- Language support plugins
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}
    use { 'nvim-treesitter/nvim-treesitter', 
        run = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = {"julia", "rust", "lua", "c"},
                highlight = {
                    enable = true,
                }
            }
        end
    }
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
    -- use { 'chrisbra/csv.vim' }

    -- Git
    use { 'TimUntersberger/neogit',
        config = function()
            require'neogit'.setup {}
        end
    }

    -- LaTeX
    use { 'lervag/vimtex' }

    -- Lua
    use { 'tjdevries/nlua.nvim' }

    -- Neuron / Note taking
    --[[ use { 
        "oberblastmeister/neuron.nvim",
        requires = {{'nvim-lua/plenary.nvim'}, {'nvim-lua/popup.nvim'},
                    {'nvim-telescope/telescope.nvim'}},
        branch = "unstable",
        } ]]

    --[[ use { 
        "jqfeld/neuron.nvim",
        requires = {{'nvim-lua/plenary.nvim'}, {'nvim-lua/popup.nvim'},
                    {'nvim-telescope/telescope.nvim'}},
        branch = "win_compat",
        }
 ]]

    -- Dev projects
    use { '~/projects/julia.nvim' }
    use { 'jqfeld/watson.nvim', 
        requires = {{'nvim-lua/plenary.nvim'}, {'nvim-lua/popup.nvim'},
                    {'nvim-telescope/telescope.nvim'}},
    }

end}

