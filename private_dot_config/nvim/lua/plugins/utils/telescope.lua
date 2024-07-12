return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup ({
                -- map <esc> to exit telescope instead of going normal mode
                defaults = {
                    mappings = {
                        i = { ["<esc>"] = actions.close }
                    }
                }
            })
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },

        config = function()
            require("telescope").setup({
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                    }
                }
            })
            require("telescope").load_extension("fzf")
        end
    },
    {
        "debugloop/telescope-undo.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },

        config = function()
            require("telescope").setup({
                extensions = {
                    undo = {
                        use_delta = false,
                        side_by_side = false,
                        layout_strategy = "vertical",
                        layout_config = {
                            preview_height = 0.8,
                        }
                    }
                }
            })
            require("telescope").load_extension("undo")
        end
    },
}
