return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require("lualine").setup({
            options = {
                themes = "catppuccin"
            },
            sections = {
                lualine_x = {
                    {
                        "aerial",
                    },
                    {
                        require("noice").api.statusline.mode.get,
                        cond = require("noice").api.statusline.mode.has,
                    }
                }
            }
        })
    end,
}