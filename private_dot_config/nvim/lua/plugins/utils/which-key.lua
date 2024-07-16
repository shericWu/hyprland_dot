return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },

    opts = {
        plugins = {
            marks = true,
            registers = true,
            spelling = {
                enabled = true,
                suggestions = 10,
            },
            presets = {
                operators = false,
                motions = false,
                text_objects = true,
                windows = true,
                nav = true, -- misc bindings to work with windows
                z = true, -- bindings for folds, spelling and others prefixed with z
                g = true, -- bindings for prefixed with g
            },
        },
        win = {
            border = "rounded",
            height = { min = 3, max = 0.15 },
            padding = { 0, 0 },
        },
        layout = {
            height = { min = 1, max = 0.15 },
            spacing = 2,
            align = "center",
        },
        show_help = false,
    }
}
