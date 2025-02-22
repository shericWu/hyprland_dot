return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },

    config = function()
        local banner = [[
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠌⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠠⠀⠀⠀⠀⠀⠉⠉⠙⠛⠻⠿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠌⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⢀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠁⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⢀⠢⠄⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠡⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⡐⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠂⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢀⠁⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠂⠀⠐⠀⠄⠐⠀⠀⠄⠀⠠⠁⠠⠀⠀⠀⠀⠀⠀⠀⢀⠀⠐⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢁⠐⠀⠈⠀⠀⢀⡐⠀⠀⠀⡀⠄⠂⠄⠐⡀⠀⠀⠠⢈⠀⠂⠠⠀⠀⠂⠀⡐⠀⠠⠀⠀⠀⠀⠀⠄⠀⠠⠀⠐⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠄⠂⠀⠀⠀⠀⠀⠀⠀⠀⣈⠒⠤⡐⡈⢀⠐⡀⠐⠀⡀⠠⠈⠄⠀⠂⠈⠄⢁⠀⠄⢁⠤⡀⠀⠀⠂⠀⠐⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⠏⢠⡅⠈⠀⠀⠀⠀⠀⠀⢀⠴⢀⠠⡉⢆⡁⠆⢠⠒⠀⠐⡀⢄⠡⢂⠌⠤⡀⠁⢈⠐⢢⠘⡂⠖⡡⠀⠀⠐⠈⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⡏⢠⡟⠀⠀⠀⠀⠀⠀⠀⣠⢏⡆⠈⠐⠡⠂⠔⡈⠄⢡⡀⠠⢀⠰⠀⢃⠘⠤⡑⠈⠆⡌⢡⠊⠐⠱⠈⠁⠀⠀⠀⠀⠀⠀⠀⢉⢿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⡿⢀⣿⠁⠀⠀⠀⠀⠀⠀⣰⣶⣿⠄⠀⠌⠡⢈⠐⠠⠈⡴⢃⠀⠄⠂⠁⡀⠡⠀⠀⠁⢨⠀⠡⠀⠂⠄⠐⠀⠀⠀⠀⠀⠀⠀⠀⠈⠘⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⡇⣼⠇⠀⠀⠀⠀⠀⠀⡼⣽⣿⣿⢂⠁⠄⠃⠤⢈⠂⠁⣿⣏⡀⠐⡀⡀⠄⠂⠈⠀⠂⠐⠀⠀⡁⠂⢈⠀⠌⠀⠀⠀⠀⠂⢀⠀⠀⢃⠘⢿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⠇⣀⡄⠀⠀⠀⠀⠄⢹⡽⠝⠛⠻⢝⠠⡌⠌⢒⡀⠘⢰⣿⣿⡦⠐⡀⢳⡀⠌⢀⠠⠐⠀⠐⠀⠄⠂⠀⠄⠂⠀⠀⠀⠀⢀⠀⠠⠀⠌⡰⡌⢿⣿⣿⣿⣿
⣿⣿⣾⣷⣶⡆⢿⡇⠀⠀⠀⠀⢈⢰⡆⣳⡳⠐⣌⢡⢰⡨⠐⡐⢎⠸⣿⣿⣷⡧⡐⡈⡷⡈⠄⣀⠂⠀⠈⢀⠂⠠⠐⠀⠂⢀⠀⠀⠈⠀⠀⡀⠄⠰⢁⢻⣌⢻⣿⣿⣿
⣿⣿⣿⣿⣿⣿⡜⣇⠀⠀⠂⠀⠀⠌⣷⣿⡇⡀⠈⢸⣧⣵⣚⣔⡘⣦⣻⣽⠒⠋⠓⡐⠘⠥⡜⠰⣄⠀⠌⠠⠐⠀⠂⢁⠀⠀⠀⠀⠀⠠⠀⠀⠐⡌⠂⣂⢿⣦⢻⣿⣿
⣿⣿⣿⣿⣿⣿⣿⠌⠀⠀⡁⠀⠀⠀⣾⣿⡗⣿⣾⣸⣿⣿⣿⣿⣿⣿⣿⣞⣽⠃⠈⠐⠂⠂⢀⠀⠘⠇⡈⠄⡁⠠⠁⠠⠀⠀⠂⠀⠀⠀⠀⠐⠀⢌⠁⢠⠊⣿⡎⣿⣿
⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠄⠀⣰⢿⣷⣿⣽⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠤⣲⣀⠤⡀⣞⠧⡈⠐⡀⢂⠀⡐⠈⠀⠐⠀⡁⠀⠀⠀⠀⠠⠀⠀⠀⠀⡒⠸⣇⣿⣿
⣿⣿⣿⣿⡟⠀⢀⡴⠁⠀⠀⠀⠀⣟⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣳⡿⣳⣾⣿⠧⢁⠡⠐⡀⠠⠀⠂⠀⡀⠠⠄⠀⠀⠀⠀⠀⢀⠀⠈⠀⢡⠑⢃⣿⣿
⣿⣿⣿⡿⠀⢀⣾⠇⠀⠠⠀⠀⣰⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣿⡻⠞⣀⠊⡀⠂⠄⢁⠠⠁⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢀⣯⢰⣿⣿
⣿⣿⣿⣿⠀⢸⣿⡆⠀⠄⢀⡀⠸⡆⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣛⣍⣰⡥⢀⠐⠠⠁⠈⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠰⣿⢈⣿⣿
⣿⣿⣿⣿⣷⣌⠛⣷⢶⣛⣾⣿⣽⣶⣖⡹⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠟⠃⡀⠂⠈⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣽⡟⢠⣿⣿
⣿⣿⣿⣿⣿⢟⡾⣿⣯⢻⣿⡟⣿⣿⡇⡽⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢶⠶⢖⠂⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢬⡿⠁⣼⣿⣿
⣿⣿⣿⣿⣇⣟⢶⢻⣿⣾⣿⣇⣿⣿⣿⣬⣄⣠⢙⠿⠿⠿⠿⠿⠿⠟⠟⠋⢛⡩⢌⠖⡼⠸⠌⡀⠂⠠⠀⢀⠂⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⢋⠔⣨⣿⣿⣿
⣿⣿⣿⣿⣿⣯⣟⢯⣏⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠠⠀⠀⠀⠈⡖⡡⢏⠚⢌⡑⢦⠈⠄⢡⠊⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠐⠀⠀⠀⢄⣱⣶⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣜⠿⣼⣛⡾⣽⣻⢿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠨⡕⢎⡹⠌⡓⠡⠈⢀⡠⠀⠠⠁⠀⡀⠀⠀⠀⠀⡀⢂⠐⣤⣄⠰⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣭⣽⣓⣫⡟⣾⡽⣿⣿⣿⣿⣿⡧⣄⡀⢀⣴⣶⣻⣯⣷⣷⢶⣆⢏⣃⡡⣔⡱⢣⠷⣶⣶⣶⠀⡖⠦⣤⣾⡀⠀⣧⣹⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡧⣽⣿⣿⣿⣿⣿⢧⣶⣰⣿⣟⣾⣿⣽⣷⣿⡿⣿⣷⣌⠳⣌⡳⣋⣞⡹⢿⣿⡄⢇⡀⣽⣯⣿⣷⢣⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡼⣿⣿⣿⣿⣿⣿⢻⢣⣿⢿⣾⣿⣽⣿⣾⣿⢿⣿⣿⣿⡆⠁⢷⣩⠖⣽⣷⡽⣿⣮⡕⠚⠙⠁⢀⢈⠻⣿⣿⣿⣿⣿⣿⣿
        ]]
        banner = "\n" .. banner .."\n\n"
        require("dashboard").setup({
            theme = "doom",
            hide = {
                statusline = false,
            },
            config = {
                header = vim.split(banner, "\n"),
                week_header = { enable = false },
                center = {
                    { action = "ene", key = "n", desc = "New file", icon = "󰝒 " },
                    { action = "Telescope oldfiles", key = "o", desc = "Recent files", icon = "󱋡 " },
                    { action = "qa", key = "q", desc = "quit", icon = "󰅙 " },
                },

                footer = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    local version = "  󰀨 ver " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
                    local plugins = "  󱁖 loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                    return {
                        "",
                        "",
                        plugins,
                        version,
                    }
                end
            },
        })
        -- return {
        --     theme = "doom",
        --     hide = {
        --         statusline = false,
        --     },
        --     config = {
        --         header = vim.split(banner, "\n"),
        --         week_header = { enable = false },
        --         center = {
        --             { action = "ene", key = "n", desc = "New file", icon = "󰝒 " },
        --             { action = "Telescope oldfiles", key = "o", desc = "Recent files", icon = "󱋡 " },
        --             { action = "qa", key = "q", desc = "quit", icon = "󰅙 " },
        --         },

        --         footer = function()
        --             local stats = require("lazy").stats()
        --             local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        --             local version = "  󰀨 ver " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
        --             local plugins = "  󱁖 loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        --             return {
        --                 "",
        --                 "",
        --                 plugins,
        --                 version,
        --             }
        --         end
        --     },
        -- }
    end
}
