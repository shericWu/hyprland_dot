return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        dependencies = {
            { "Bilal2453/luvit-meta", lazy = true },
        },

        opts = {
            library = {
                "lazy.nvim",
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
}
