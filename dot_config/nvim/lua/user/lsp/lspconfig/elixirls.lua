return {
    settings = {
        elixirLS = {
            dialyzerEnabled = true,
            suggestSpecs = true,
            dialyzerFormat = "dialyzer_short",
            enableTestLenses = true,
            -- using neotest for this
            -- signatureAfterComplete = true,
        },
    },
    -- required till https://github.com/elixir-lsp/elixir-ls/issues/886 is fixed with OTP 26.0.2
    cmd_env = {
        ASDF_ELIXIR_VERSION = "1.14.5-otp-25",
        ASDF_ERLANG_VERSION = "25.3",
    },
    -- cmd = { "/Users/juliandoherty/src/opensource/elixir-ls/release/language_server.sh" },
    -- manual_managed = true,
}
