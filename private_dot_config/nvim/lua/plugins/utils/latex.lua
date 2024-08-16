return {
    {
        "lervag/vimtex",
        lazy = false,

        config = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_view_general_viewer = "zathura"
            -- vim.g.vimtex_view_general_options = '-x "nvr --remote +%{line} ${input}" --synctex-forward @line:@col:@tex'
            vim.g.vimtex_view_general_options_latexmk = "-reuse-instance"
            return {}
        end
    }
}
