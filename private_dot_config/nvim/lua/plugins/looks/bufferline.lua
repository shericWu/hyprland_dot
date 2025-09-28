return {
    "akinsho/bufferline.nvim",
    after = "catppuccin",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "catppuccin/nvim",
    },

    opts = function ()
        local highlight = require("catppuccin.special.bufferline").get_theme({
            styles = { "bold" }
        })
        return {
            highlights = highlight,
            options = {
                separator_style = "slope",
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "Nvim Tree",
                        text_align = "center",
                        highlight = "Directory",
                        separator = true,
                    }
                },
            },
        }
    end
}
