return {
  -- telescope
  -- a nice seletion UI also to find and open files
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      local telescope = require 'telescope'
      local actions = require('telescope.actions')
      local previewers = require("telescope.previewers")
      local new_maker = function(filepath, bufnr, opts)
        opts = opts or {}
        filepath = vim.fn.expand(filepath)
        vim.loop.fs_stat(filepath, function(_, stat)
          if not stat then return end
          if stat.size > 100000 then
            return
          else
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
          end
        end)
      end
      telescope.setup {
        defaults = {
          buffer_previewer_maker = new_maker,
          file_ignore_patterns = { "node_modules", "%_files/*.html", "%_cache", ".git/", "site_libs", ".venv" },
          layout_strategy = "flex",
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top",
          },
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
              ["<esc>"] = actions.close,
              ["<c-j>"] = actions.move_selection_next,
              ["<c-k>"] = actions.move_selection_previous,
            }
          }
        },
        pickers = {
          find_files = {
            hidden = true,
            find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*",
              '--glob', '!**/.Rproj.user/*', '-L' },
          }
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        }
      }
      telescope.load_extension('ui-select')
      telescope.load_extension('fzf')
      telescope.load_extension('ui-select')
      telescope.load_extension('file_browser')
      -- telescope.load_extension('dap')
    end
  },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  { 'nvim-telescope/telescope-fzf-native.nvim',  build = 'make' },
  -- { 'nvim-telescope/telescope-dap.nvim' },
  { 'nvim-telescope/telescope-file-browser.nvim' },

  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          section_separators = '',
          component_separators = '',
          globalstatus = true,
          -- theme = "catpuccin"
        },
        sections = {
          lualine_a = { 'mode' },
          -- lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_b = {},
          lualine_c = { 'searchcount' },
          lualine_x = { 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        -- extensions = { 'nvim-tree' },
        priority = 1001,
      }
    end
  },

  -- {
  --   'nanozuki/tabby.nvim',
  --   config = function()
  --     require 'tabby.tabline'.use_preset('tab_only')
  --   end
  -- },

  -- show keybinding help window
  { 'folke/which-key.nvim' },

  -- filetree
  -- {
  --   'nvim-tree/nvim-tree.lua',
  --   keys = {
  --     -- { '<c-b>', ':NvimTreeToggle<cr>' },
  --   },
  --   config = function()
  --     require 'nvim-tree'.setup {
  --       disable_netrw       = true,
  --       update_focused_file = {
  --         enable = true,
  --       },
  --       git                 = {
  --         enable = true,
  --         ignore = false,
  --         timeout = 500,
  --       },
  --       diagnostics         = {
  --         enable = true,
  --       },
  --       filters             = {
  --         dotfiles = true,
  --         custom = {
  --           [[.*\.pdf]],
  --         },
  --       }
  --     }
  --     require "which-key".add({
  --       { "<Leader>b", ":NvimTreeToggle<CR>", desc = "Toggle NvimTree" }
  --     })
  --   end,
  --   lazy = false,
  -- },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      delete_to_trash = true,
      view_options = {
      is_hidden_file = function(name, bufnr)
        local m = name:match("^%.")
        local pdf = name:match("%.pdf")
        return m ~= nil or pdf ~= nil 
      end,
      }
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    keys = {
      { '<leader>b', ':Oil<cr>', desc = 'Browse files (oil.nvim)' },
    },
  },

  {
    'simrat39/symbols-outline.nvim',
    cmd = 'SymbolsOutline',
    keys = {
      { '<leader>lo', ':SymbolsOutline<cr>', desc = 'symbols outline' },
    },
    config = function()
      require("symbols-outline").setup()
    end
  },

  -- terminal
  -- {
  --   "akinsho/toggleterm.nvim",
  --   version = '*',
  --   config = function()
  --     require("toggleterm").setup {
  --       open_mapping = [[<c-\>]],
  --       direction = 'float',
  --     }
  --   end
  -- },
  -- show diagnostics list
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {}
    end
  },

  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  {
    'lukas-reineke/headlines.nvim',
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("headlines").setup {
      }
    end
  }


}
