return {
    "max397574/better-escape.nvim",

    config = function()
        require("better_escape").setup({
            timeout = vim.o.timeoutlen,
            default_mappings = false,
            mappings = {
                i = {
                    j = { j = "<Esc>" }
                },
                c = {
                    j = { j = "<Esc>" }
                },
                t = {
                    j = { j = "<Esc>" }
                },
                v = {
                    j = { j = "<Esc>" }
                },
                s = {
                    j = { j = "<Esc>" }
                },
            }
        })
    end,
}
