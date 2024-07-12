return {
    "catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
    lazy = false,

    config = function()
        require("catppuccin").setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = true, -- disables setting the background color.
            show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
            term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
            dim_inactive = {
                enabled = false, -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15, -- percentage of the shade to apply to the inactive window
            },
            default_integrations = true,
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

                -- utils
                treesitter = true,
                which_key = true,
                markdown = true,

                -- looks
                indent_blankline = {
                    enabled = true,
                    scope_color = "surface2",
                    colored_indent_levels = false,
                },
                nvimtree = true,
                colorful_winsep = {
                    enabled = true,
                    color = "lavender",
                },
                aerial = true,
                notify = true,
                noice = true,
            },
        })

	    vim.cmd.colorscheme("catppuccin")
    end
}
