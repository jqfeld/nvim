local iron = require('iron')

iron.core.add_repl_definitions {
  julia = {
    julia_file = {
      command = {"julia", "--project=@."}
    }
  }
}

iron.core.set_config {
  preferred = {
    julia = "julia_file"
  },
  repl_open_cmd = "rightbelow split"
}



-- require('kommentary.config').configure_language("julia", {
--     single_line_comment_string = "#",
--     multi_line_comment_string = {"#=", "=#"},
--     prefer_single_line_comments = true,
-- })
-- require('kommentary.config').configure_language("default", {
--     prefer_single_line_comments = true,
-- })
--

-- Setup telescope
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        -- vim.fn["vsnip#anonymous"](args.body)

        -- For `luasnip` user.
        require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
    },
    sources = {
      { name = 'nvim_lsp' },

      -- For luasnip user.
      { name = 'luasnip' },

      { name = 'buffer', keyword_length = 5 },
      { name = 'path'},
      { name = 'neorg' },
    },
      experimental = {
        -- I like the new menu better! Nice work hrsh7th
        native_menu = false,

        -- Let's play with this for a day or two
        ghost_text = true,
      },
})

  -- Setup lspconfig.
  -- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
  --   capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- }

--[[ require('neuron').setup {
    neuron_dir = "~/Dropbox/neuron", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
}
 ]]
