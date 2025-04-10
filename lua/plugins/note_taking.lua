return {
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

  -- {
  --   'vigoux/ltex-ls.nvim',
  --   dependencies = { 'neovim/nvim-lspconfig' },
  --   config = function()
  --     require 'ltex-ls'.setup {
  --       use_spellfile = false, -- Uses the value of 'spellfile' as an external file when checking the document
  --       -- window_border = 'single', -- How the border should be rendered
  --       -- Put your lsp config here, just like with nvim-lspconfig
  --     }
  --   end,
  -- },
  --
}
