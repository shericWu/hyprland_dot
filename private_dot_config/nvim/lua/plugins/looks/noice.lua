return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },

    config = function()
        require("noice").setup({
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                lsp_doc_border = true,
            },
            routes = {
                view = "notify",
                filter = {
                    event = "msg_showmode",
                    any = {
                        { find = "recording" }
                    }
                },
            },
        })
    end,
}
