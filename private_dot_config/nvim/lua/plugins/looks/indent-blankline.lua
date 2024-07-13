return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",

    opts = {
        indent = {
            char = "▏",
        },
        scope = {
            show_start = false,
        },
        exclude = {
            filetypes = {
                "help",
                "dashboard",
                "lazy",
                "mason",
                "notify",
                "NvimTree",
            }
        },
    }
}
