return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
        "neovim/nvim-lspconfig",
        "nvimdev/lspsaga.nvim",
        "hrsh7th/nvim-cmp"
    },

    opts = {
        presets = {
            bottom_search = false,
            command_palette = true,
            long_message_to_split = true,
            lsp_doc_border = true,
            inc_rename = false,
        },
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                ["vim.lsp.util.stylize_markdown"] = false,
                ["cmp.entry.get_documentation"] = false,
            },
            hover = { enabled = false },
            signature = { enabled = false }
        },
    }
}
