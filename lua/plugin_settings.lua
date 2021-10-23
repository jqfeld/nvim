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



require('kommentary.config').configure_language("julia", {
    single_line_comment_string = "#",
    multi_line_comment_string = {"#=", "=#"},
    prefer_single_line_comments = true,
})
require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})

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

      { name = 'buffer' },
      { name = 'neorg' },
    }
  })

  -- Setup lspconfig.
  -- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
  --   capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- }

--[[ require('neuron').setup {
    neuron_dir = "~/Dropbox/neuron", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
}
 ]]
