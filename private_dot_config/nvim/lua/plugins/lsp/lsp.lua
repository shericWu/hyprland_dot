return {
    {
		"williamboman/mason.nvim",

        config = function()
            require("mason").setup({
                ui = {
                    width = 0.7,
                    height = 0.7,
                    border = "rounded",
                }
            })
        end
    },
    {
		"williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },

        config = function()
            require("mason-lspconfig").setup()
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
            })
        end
    },
    {
        "neovim/nvim-lspconfig",

        config = function()
            require("lspconfig.ui.windows").default_options.border = "rounded"
			vim.diagnostic.config({
				virtual_text = false,
				signs = true,
				severity_sort = true,
			})
        end
    },
    {
        "nvimdev/lspsaga.nvim",
        dependencies = { "neovim/nvim-lspconfig" },

        config = function()
            require("lspsaga").setup({
                ui = {
                    border = "rounded",
                    title = false,
                    kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
                },
				lightbulb = {
					enable = true,
					sign = false,
					virtual_text = true,
				},
            })
        end,
    },
}
