return {
    "catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
    lazy = false,

    config = function()
        local sign = vim.fn.sign_define
        sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
        sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
        sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

        require("catppuccin").setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                dark = "mocha",
            },
            transparent_background = true, -- disables setting the background color.
            custom_highlights = function(mocha)
                return {
                    DashboardHeader = { fg = mocha.text },
                }
            end,
            integrations = {
                -- lsp
                mason = true,
                lsp_saga = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                        ok = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                        ok = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                cmp = true,
                dap = true,
                dap_ui = true,

                -- utils
                aerial = true,
                markdown = true,
                mini = { enabled = true },
                nvimtree = true,
                treesitter = true,
                telescope = { enabled = true },
                which_key = true,

                -- looks
                colorful_winsep = {
                    enabled = true,
                    color = "lavender",
                },
                dashboard = true,
                indent_blankline = {
                    enabled = true,
                    scope_color = "surface2",
                    colored_indent_levels = false,
                },
                noice = true,
                notify = true,
            },
        })

	    vim.cmd.colorscheme("catppuccin")
    end
}
