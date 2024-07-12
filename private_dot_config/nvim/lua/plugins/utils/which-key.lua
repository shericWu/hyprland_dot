return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        plugins = {
            marks = true,
            registers = true,
            spelling = {
                enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20,
            },
            presets = {
                operators = false,
                motions = false,
                text_objects = true,
                windows = false,
                nav = false, -- misc bindings to work with windows
                z = true, -- bindings for folds, spelling and others prefixed with z
                g = true, -- bindings for prefixed with g
            },
        },
        -- add operators that will trigger motion and text object completion
        -- to enable all native operators, set the preset / operators plugin above
        operators = { gc = "Comments" },
        key_labels = {
            -- override the label used to display some keys
            ["<space>"] = "<spc>",
        },
        window = {
            border = "single",
            position = "bottom",
            margin = { 1, 0, 1, 0 },
            padding = { 0, 0, 0, 0 },
        },
        layout = {
            height = { min = 1, max = 6 },
            width = { min = 20, max = 50 },
            spacing = 2,
            align = "right",
        },
        ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    }
}
