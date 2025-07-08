return {
    settings = {
        eslint = {
            run = "onSave", -- eslint is too slow on large code bases for onType
        }
    },
    flags = {
        allow_incremental_sync = false,
        debounce_text_changes = 2000,
    }
}
