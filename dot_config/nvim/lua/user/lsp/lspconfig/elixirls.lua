return {
    settings = {
        elixirLS = {
            autoBuild = true,
            dialyzerEnabled = true,
            incrementalDialyzer = false,
            suggestSpecs = true,
            fetchDeps = true,
            -- dialyzerFormat = "dialyzer_short",
            -- enableTestLenses = true,
            -- using neotest for this
            signatureAfterComplete = true,
        },
    },
    enabled = true,
    -- cmd = { os.getenv("HOME") .. "/.local/share/nvim/mason/bin/elixir-ls" },
}
