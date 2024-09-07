return {
    "mfussenegger/nvim-lint",
    event = {
        "BufEnter",
        "BufWritePost",
        "InsertLeave",
    },

    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            -- markdown = { "vale" },
            sh = { "shellcheck" },
        }
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end
}
