return {
    settings = {
        eslint = {
            run = "onSave", -- eslint is too slow on large code bases for onType
        }
    },
}
