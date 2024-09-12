vim.api.nvim_create_autocmd({"BufEnter"}, {
    pattern = { "*.tex" },
    command = "VimtexCompile"
})

vim.api.nvim_create_autocmd({"CursorMoved"}, {
    pattern = { "*.tex" },
    command = "VimtexView"
})

vim.api.nvim_create_autocmd({"BufEnter"}, {
    pattern = { "Makefile", "makefile" },
    callback = function ()
        vim.opt.expandtab = false
    end
})

vim.api.nvim_create_autocmd({"BufLeave"}, {
    pattern = { "Makefile", "makefile" },
    callback = function ()
        vim.opt.expandtab = true
    end
})
