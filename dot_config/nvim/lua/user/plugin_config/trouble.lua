local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
    return
end

trouble.setup({
    auto_open = false,
    warn_no_results = false,
    open_no_results = true,
})
