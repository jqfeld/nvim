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

require'navigator'.setup({
    on_attach = function()
        require'lsp_signature'.on_attach()
    end,
    lsp = {
        format_on_save = true,
        julials = {
            cmd = julia_cmd,
            capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
            on_new_config = function(new_config, _)
                new_config.cmd =julia_cmd
            end
        }
    }
})


