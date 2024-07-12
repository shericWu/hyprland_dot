return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "catppuccin/nvim",
    },

    config = function()
        require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get({
				styles = {
					"bold",
				},
			}),
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
        })
    end,
}
