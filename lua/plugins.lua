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

    -- neorg
    use { 
        "nvim-neorg/neorg",
        branch = "main",
        config = function()
            require('neorg').setup {
                -- Tell Neorg what modules to load
                load = {
                    ["core.defaults"] = {}, -- Load all the default modules
                    ["core.norg.concealer"] = {}, -- Allows for use of icons
                    ["core.keybinds"] = { -- Configure core.keybinds
                        config = {
                            default_keybinds = true, -- Generate the default keybinds
                            neorg_leader = "<Leader>o" -- This is the default if unspecified
                        }
                    },
                    ["core.norg.dirman"] = { -- Manage your directories with Neorg
                        config = {
                            workspaces = {
                                main = "~/Seafile/Neorg/personal",
                                work = "~/Seafile/Neorg/work",
                                gtd = "~/Seafile/Neorg/gtd"
                            }
                        }
                    },
                    ["core.integrations.telescope"] = {}, -- Enable the telescope module
                    ["core.gtd.base"] = {
                        config = {
                            workspace = "gtd" -- assign the workspace,
                        },
                    } -- Enable GTD module
                },
            }
        end,
        requires = {"nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope"}
    }

    -- Syle plugins
    -- use { "npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    use { "sainnhe/gruvbox-material"}
    use { "kyazdani42/nvim-web-devicons" }
    use { "romgrk/barbar.nvim", requires = {"kyazdani42/nvim-web-devicons"}}
    use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function()
      require('lualine').setup{
        options = {
          theme = 'gruvbox',
          section_separators = {left = '', right=''},
          component_separators = {left = '', right=''},
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
      }
    end
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
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

    if vim.api.nvim_call_function('has',{"unix"}) then
        use {
            "jqfeld/FTerm-nnn.nvim",
            requires = { "jqfeld/FTerm.nvim" },
        }
        -- use {
        --     "luukvbaal/nnn.nvim",
        --     config = function() require("nnn").setup() end
        -- }
    end
    -- Language support plugins
    use { 'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

            parser_configs.norg = {
                install_info = {
                    url = "https://github.com/nvim-neorg/tree-sitter-norg",
                    files = { "src/parser.c", "src/scanner.cc" },
                    branch = "main"
                },
            }

            require'nvim-treesitter.configs'.setup {
                ensure_installed = {"julia", "rust", "lua", "c", "norg"},
                highlight = {
                    enable = true,
                }
            }
        end
    }

    use({
      "neovim/nvim-lspconfig",
      config = function()
        local function create_capabilities()
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.completion.completionItem.snippetSupport = true
          capabilities.textDocument.completion.completionItem.preselectSupport = true
          capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
          capabilities.textDocument.completion.completionItem.deprecatedSupport = true
          capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
          capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
          capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
          capabilities.textDocument.completion.completionItem.resolveSupport = {
            properties = { "documentation", "detail", "additionalTextEdits" },
          }
          capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown" }
          capabilities.textDocument.codeAction = {
            dynamicRegistration = true,
            codeActionLiteralSupport = {
              codeActionKind = {
                valueSet = (function()
                  local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
                  table.sort(res)
                  return res
                end)(),
              },
            },
          }
          return capabilities
        end

        -- disable virtual text (recommended for julia)
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = false,
          underline = false,
          signs = true,
          update_in_insert = false,
        })

        local on_attach = function(client, bufnr)
          local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
          local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
          buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
          -- Mappings.
          local opts = { noremap=true, silent=true }

          -- See `:help vim.lsp.*` for documentation on any of the below functions
          buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
          buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
          buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
          buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
          buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
          buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
          buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
          buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
          buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
          buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
          buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
          buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
          buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
          buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
          buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
          buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
          buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
        end

        local lspconfig = require("lspconfig")

        local function lsp_setup(name, config)
          lspconfig[name].setup(config)
        end

        lsp_setup("julials", {
          on_attach = on_attach,
          capabilities = create_capabilities(),
        })

      end,
    })

    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'L3MON4D3/LuaSnip' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/nvim-cmp' }

    use { 'ray-x/lsp_signature.nvim' }
    -- use { 'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}

    use { 'b3nj5m1n/kommentary' }

    -- Rust
    use { 'rust-lang/rust.vim' }

    -- Julia
    use { 'JuliaEditorSupport/julia-vim' }
    use { 'hkupty/iron.nvim' }


    -- Tables
    use { 'dhruvasagar/vim-table-mode' }

    -- Git
    use { 'TimUntersberger/neogit',
        config = function()
            require'neogit'.setup {}
        end
    }

    -- LaTeX
    use { 'lervag/vimtex' }

    -- Lua
    -- use { 'tjdevries/nlua.nvim' }


    -- Dev projects
    use { 'jqfeld/watson.nvim', 
        requires = {{'nvim-lua/plenary.nvim'}, {'nvim-lua/popup.nvim'},
                    {'nvim-telescope/telescope.nvim'}},
    }


end}

