return {
    {
		"williamboman/mason.nvim",

        opts = {
            ui = {
                width = 0.7,
                height = 0.7,
                border = "rounded",
            }
        }
    },
    {
		"williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },

        opts = function()
            require("mason-lspconfig").setup()
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
            })
            return {}
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "p00f/clangd_extensions.nvim",
            "ray-x/lsp_signature.nvim",
        },

        config = function()
            require("clangd_extensions.inlay_hints").setup_autocmd()
            require("clangd_extensions.inlay_hints").set_inlay_hints()
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufnr = args.buf
                    require("lsp_signature").on_attach({}, bufnr)
                end
            })

            vim.diagnostic.config({
                virtual_text = {
                    prefix = '●',
                },
                signs = true,
                severity_sort = true,
                underline = true,
                update_in_insert = false,
            })

            for _, diag in ipairs({ "Error", "Warn", "Info", "Hint" }) do
                vim.fn.sign_define("DiagnosticSign" .. diag, {
                    text = "",
                    texthl = "DiagnosticSign" ..diag,
                    linehl = "",
                    numhl = "DiagnosticSign" .. diag,
                })
            end
        end
    },
    {
        "nvimdev/lspsaga.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        event = "LspAttach",

        opts = {
            definition = {
                width = 0.6,
                height = 0.5,
                keys = {
                    vsplit = "<C-c>|",
                    split = "<C-c>_",
                }
            },
            diagnostic = {
                max_width = 0.6,
                max_height = 0.5,
                max_show_width = 0.6,
                max_show_height = 0.5,
            },
            finder = {
                max_height = 0.5,
                left_width = 0.3,
                right_width = 0.3,
                default = "def+ref+imp",
                keys = {
                    vsplit = "|",
                    split = "_",
                }
            },
            hover = {
                max_width = 0.8,
                max_height = 0.5,
                open_cmd = "!firefox"
            },
            outline = {
                keys = {
                    toggle_or_jump = "<CR>"
                }
            },
            rename = {
                quit = "<C-c>"
            },
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
        }
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",

        opts = {
            hint_prefix = {
                above = "↙ ",
                current = "← ",
                below = "↖ "
            },
            floating_window = false,
            timer_interval = 100,
        }
    },
    {
        "p00f/clangd_extensions.nvim",

        opts = {}
    },
}
