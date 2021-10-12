-- local julia_cmd = {
--                 "julia",
--                 "--startup-file=no",
--                 "--history-file=no",
--                 "-e", [[
--                     using Pkg;
--                     Pkg.instantiate()
--                     using LanguageServer; using SymbolServer;
--                     depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
--                     project_path = dirname(something(Base.current_project(pwd()), Base.load_path_expand(LOAD_PATH[2])))
--                     # Make sure that we only load packages from this environment specifically.
--                     @info "Running language server" env=Base.load_path()[1] pwd() project_path depot_path
--                     server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path);
--                     server.runlinter = true;
--                     run(server);
--                 ]]
--             }

local julia_cmd = {
    'julia',
      '--startup-file=no',
      '--history-file=no',
      '-e',
      [[
        using Pkg;
        Pkg.instantiate();
        using LanguageServer;
        import SymbolServer;
        import StaticLint;
        depot_path = get(ENV, "JULIA_DEPOT_PATH", "");
        project_path = let
            dirname(something(
                ## 1. Finds an explicitly set project (JULIA_PROJECT)
                Base.load_path_expand((
                    p = get(ENV, "JULIA_PROJECT", nothing);
                    p === nothing ? nothing : isempty(p) ? nothing : p
                )),
                ## 2. Look for a Project.toml file in the current working directory,
                ##    or parent directories, with $HOME as an upper boundary
                Base.current_project(),
                ## 3. First entry in the load path
                get(Base.load_path(), 1, nothing),
                ## 4. Fallback to default global environment,
                ##    this is more or less unreachable
                Base.load_path_expand("@v#.#"),
            ))
        end
        @info "Running language server" VERSION pwd() project_path depot_path
        server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path);
        server.runlinter = true;
        run(server);
      ]],
}

-- require'navigator'.setup({
--     on_attach = function()
--         require'lsp_signature'.on_attach()
--         require'completion'.on_attach()
--     end,
--     lsp = {
--         format_on_save = true,
--         julials = {
--             cmd = julia_cmd,
--             on_new_config = function(new_config, _)
--                 new_config.cmd =julia_cmd
--             end
--         }
--     }
-- })



--[[
local nvim_lsp = require('lspconfig')

require('lsp_extensions').inlay_hints{
  enabled = {
    "TypeHint",
    "ChainingHint",
    "ParameterHint"
  }
}

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover,
    {
        border = "single"
    }
)
 ]]

--local on_attach = function(client, bufnr)
--    -- activate completion
--
--    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
--
--    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--    -- Mappings.
--    local opts = { noremap=true, silent=true }
--    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
--    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
--    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
--    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
--    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
--    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
--
--    -- Set some keybinds conditional on server capabilities
--    if client.resolved_capabilities.document_formatting then
--    buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
--    elseif client.resolved_capabilities.document_range_formatting then
--    buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
--    end
--
--    -- Set autocommands conditional on server_capabilities
--    if client.resolved_capabilities.document_highlight then
--    vim.api.nvim_exec([[
--      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
--      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
--      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
--      augroup lsp_document_highlight
--        autocmd! * <buffer>
--        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--      augroup END]], false)
--    end
--    require'completion'.on_attach()
--end

--[[
nvim_lsp.rust_analyzer.setup{
  on_attach = on_attach,
  inlineHints = {
    enable = true,
    parameterHints = true,
    typeHints = true
  }
}
 ]]

--[[
nvim_lsp.julials.setup{
    cmd = julia_cmd,
    on_new_config = function(new_config,_) 
        new_config.cmd = julia_cmd 
    end,
    on_attach = on_attach
}

nvim_lsp.texlab.setup{
    on_attach = on_attach
}
 ]]

-- Your custom attach function for nvim-lspconfig goes here.
--local custom_nvim_lspconfig_attach = function(...) end
--
---- To get builtin LSP running, do something like:
---- NOTE: This replaces the calls where you would have before done `require('nvim_lsp').sumneko_lua.setup()`
--[[ require('nlua.lsp.nvim').setup(require('lspconfig'), {
 on_attach = custom_nvim_lspconfig_attach,

 -- Include globals you want to tell the LSP are real :)
 globals = {
   -- Colorbuddy
   "Color", "c", "Group", "g", "s",
 }
}) ]]
