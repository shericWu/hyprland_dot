return {
    {
        "lervag/vimtex",
        lazy = false,

        config = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_view_general_viewer = "zathura"
            -- vim.g.vimtex_view_general_options = '-x "nvr --remote +%{line} ${input}" --synctex-forward @line:@col:@tex'
            vim.g.vimtex_view_general_options_latexmk = "-reuse-instance"
            -- vim.g.vimtex_compiler_latexmk = {
            --     executable = 'latexmk',
            --     options = {
            --         '-xelatex',  -- Specifies the use of XeLaTeX
            --         '-file-line-error',
            --         '-synctex=1',
            --         '-interaction=nonstopmode',
            --     },
            -- }
            return {}
        end
    }
}
