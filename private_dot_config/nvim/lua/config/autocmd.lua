vim.api.nvim_create_autocmd({"BufEnter"}, {
    pattern = { "*.tex" },
    command = "VimtexCompile"
})

vim.api.nvim_create_autocmd({"CursorMoved"}, {
    pattern = { "*.tex" },
    command = "VimtexView"
})
