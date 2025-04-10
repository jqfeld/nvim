return {
  -- completion
  -- {
  --   'hrsh7th/nvim-cmp',
  --   branch = 'main',
  --   dependencies = {
  --     { 'hrsh7th/cmp-nvim-lsp' },
  --     { 'hrsh7th/cmp-nvim-lsp-signature-help' },
  --     { 'hrsh7th/cmp-buffer' },
  --     { 'hrsh7th/cmp-path' },
  --     { 'hrsh7th/cmp-calc' },
  --     { 'hrsh7th/cmp-emoji' },
  --     { 'saadparwaiz1/cmp_luasnip' },
  --     { 'f3fora/cmp-spell' },
  --     { 'ray-x/cmp-treesitter' },
  --     { 'kdheepak/cmp-latex-symbols' },
  --     { 'jmbuhr/cmp-pandoc-references' },
  --     {
  --       'L3MON4D3/LuaSnip',
  --       version = nil,
  --       branch = 'master'
  --     },
  --     -- { 'rafamadriz/friendly-snippets' },
  --     { 'onsails/lspkind-nvim' },
  --   },
  --   config = function()
  --     local cmp = require 'cmp'
  --     local luasnip = require 'luasnip'
  --     local lspkind = require "lspkind"
  --     lspkind.init()
  --
  --     luasnip.config.set_config({ -- Setting LuaSnip config
  --       -- Enable autotriggered snippets
  --       enable_autosnippets = true,
  --       ft_func = require("luasnip.extras.filetype_functions").from_pos_or_filetype,
  --       load_ft_func = require("luasnip.extras.filetype_functions").extend_load_ft({
  --         markdown = { "latex", "tex" }
  --       }),
  --     })
  --
  --     local has_words_before = function()
  --       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  --     end
  --
  --     cmp.setup({
  --       snippet = {
  --         expand = function(args)
  --           luasnip.lsp_expand(args.body)
  --         end,
  --       },
  --       mapping = {
  --         ["<C-n>"] = cmp.mapping(function(fallback)
  --           if cmp.visible() then
  --             cmp.select_next_item()
  --           elseif luasnip.expand_or_jumpable() then
  --             luasnip.expand_or_jump()
  --           elseif has_words_before() then
  --             cmp.complete()
  --           else
  --             fallback()
  --           end
  --         end, { "i", "s" }),
  --         ["<C-p>"] = cmp.mapping(function(fallback)
  --           if cmp.visible() then
  --             cmp.select_prev_item()
  --           elseif luasnip.jumpable(-1) then
  --             luasnip.jump(-1)
  --           else
  --             fallback()
  --           end
  --         end, { "i", "s" }),
  --         ["<C-k>"] = cmp.mapping(function(fallback)
  --           if luasnip.expand_or_jumpable() then
  --             luasnip.expand_or_jump()
  --           else
  --             fallback()
  --           end
  --         end, { "i", "s" }),
  --         ["<C-j>"] = cmp.mapping(function(fallback)
  --           if luasnip.jumpable(-1) then
  --             luasnip.jump(-1)
  --           else
  --             fallback()
  --           end
  --         end, { "i", "s" }),
  --         ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --         ["<C-e>"] = cmp.mapping.abort(),
  --         ["<c-y>"] = cmp.mapping(
  --           cmp.mapping.confirm {
  --             behavior = cmp.ConfirmBehavior.Insert,
  --             select = true,
  --           },
  --           { "i", "c" }
  --         ),
  --         ["<M-y>"] = cmp.mapping(
  --           cmp.mapping.confirm {
  --             behavior = cmp.ConfirmBehavior.Replace,
  --             select = false,
  --           },
  --           { "i", "c" }
  --         ),
  --
  --         ["<C-space>"] = cmp.mapping {
  --           i = cmp.mapping.complete(),
  --           c = function(
  --               _ --[[fallback]]
  --           )
  --             if cmp.visible() then
  --               if not cmp.confirm { select = true } then
  --                 return
  --               end
  --             else
  --               cmp.complete()
  --             end
  --           end,
  --         },
  --         ["<tab>"] = cmp.config.disable,
  --       },
  --       autocomplete = false,
  --       preselect = require('cmp').PreselectMode.None,
  --       formatting = {
  --         format = lspkind.cmp_format {
  --           with_text = true,
  --           menu = {
  --             luasnip = "[snip]",
  --             nvim_lsp = "[LSP]",
  --             buffer = "[buf]",
  --             path = "[path]",
  --             gitroot = "[gitroot]",
  --             -- drwatson = "[drwatson]",
  --             spell = "[spell]",
  --             pandoc_references = "[ref]",
  --             tags = "[tag]",
  --             treesitter = "[TS]",
  --             calc = "[calc]",
  --             latex_symbols = "[tex]",
  --             emoji = "[emoji]",
  --           },
  --         },
  --       },
  --       sources = {
  --         { name = 'path' },
  --         {
  --           name = 'nvim_lsp',
  --           priority = 100,
  --           -- option = {
  --           --   mardown_oxide = {
  --           --     keyword_pattern = [[\(\k\| \|\/\|#\)\+]] }
  --           -- }
  --         },
  --         { name = 'gitroot' },
  --         -- { name = 'drwatson' },
  --         { name = 'nvim_lsp_signature_help' },
  --         { name = 'luasnip',                keyword_length = 3, max_item_count = 3 },
  --         { name = 'pandoc_references' },
  --         { name = 'buffer',                 keyword_length = 5, max_item_count = 3 },
  --         -- { name = 'spell' ,                 keyword_length = 3,},
  --         { name = 'treesitter',             keyword_length = 5, max_item_count = 3 },
  --         -- { name = 'calc' },
  --         { name = 'latex_symbols' },
  --         { name = 'emoji' },
  --       },
  --       view = {
  --         entries = "native",
  --       },
  --       window = {
  --         documentation = {
  --           border = require 'misc.style'.border,
  --         },
  --       },
  --     })
  --     -- for friendly snippets
  --     -- require("luasnip.loaders.from_vscode").lazy_load()
  --     -- for custom snippets
  --     -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snips" } })
  --     require("luasnip.loaders.from_lua").load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
  --   end
  -- },
  -- { "jqfeld/cmp-gitroot", dev = false },


  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 
      {'rafamadriz/friendly-snippets'} ,
      { 
        'L3MON4D3/LuaSnip', version = 'v2.*' , 
        config = function() require("luasnip.loaders.from_lua").load({ paths = { vim.fn.stdpath("config") .. "/snippets" } }) end
      },
    },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = 'default' },
      snippets = { preset = 'luasnip' },
      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },

}
