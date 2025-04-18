return {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
      require('nvim-autopairs').remove_rule('`')
    end
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  {
    'chomosuke/typst-preview.nvim',
    lazy = false, -- or ft = 'typst'
    version = '1.*',
    build = function() require 'typst-preview'.update() end,
    config = function()
      require("typst-preview").setup {
        -- get_root = require("lspconfig.util").find_git_ancestor,
        -- open_cmd = 'firefox %s --class typst-preview'
        -- open_cmd = 'GDK_BACKEND=x11 /usr/bin/surf %s'
        open_cmd = 'vimb -i %s'
      }
    end,
    keys = {
      { "<LocalLeader>p", "<CMD>TypstPreview<CR>", desc = "Open Typst preview" },
    },
  },

  { 'vigoux/ltex-ls.nvim' },

  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        relative_to_current_file = true,
        copy_images = true,
      }
      -- add options here
      -- or leave it empty to use the default settings
    },
    keys = {
      -- suggested keymap
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
}
