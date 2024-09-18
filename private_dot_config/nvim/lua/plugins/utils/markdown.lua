return {
    {
        "MeanderingProgrammer/markdown.nvim",
        name = "render-markdown",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        enabled = false,

        opts = {}
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = "npm install"
    }
}
