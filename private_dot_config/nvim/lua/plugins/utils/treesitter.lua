return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",

        config = function()
            require("nvim-treesitter.configs").setup({
                auto_install = true,
                ensure_installed = {
                    "asm",
                    "bash",
                    "bibtex",
                    "c",
                    "cmake",
                    "comment",
                    "cpp",
                    "diff",
                    "dockerfile",
                    "doxygen",
                    "fish",
                    "git_config",
                    "git_rebase",
                    "gitattributes",
                    "gitcommit",
                    "gitignore",
                    "go",
                    "html",
                    "hyprlang",
                    "java",
                    "javascript",
                    "json",
                    "latex",
                    "lua",
                    "luadoc",
                    "luap",
                    "make",
                    "markdown",
                    "markdown_inline",
                    "matlab",
                    "mermaid",
                    "php",
                    "passwd",
                    "printf",
                    "python",
                    "query",
                    "r",
                    "regex",
                    "ruby",
                    "rust",
                    "sql",
                    "ssh_config",
                    "tmux",
                    "toml",
                    "vim",
                    "vimdoc",
                    "yaml",
                    "xml",
                    "zathurarc",
                },
                highlight = {
                    enable = true,
                    -- additional_vim_regex_highlighting = { "markdown" },
                },
                indent = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<leader>vv",
                        node_incremental = "<leader>vi",
                        node_decremental = "<leader>vd",
                        scope_incremental = "<leader>vs"
                    }
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,

                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                        },
                        selection_modes = {
                            ['@parameter.outer'] = 'v',
                            ['@function.outer'] = 'v',
                            ['@class.outer'] = 'v',
                        },
                        include_surrounding_whitespace = true,
                    },
                },
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
    }
}
