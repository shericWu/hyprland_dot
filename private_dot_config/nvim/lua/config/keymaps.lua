local whichkey = require("which-key")
local notify = require("notify")

whichkey.register({
    ["<leader>f"] = {
        name = "+find",
        s = { "<cmd>NvimTreeToggle<CR>", "File system tree" },
        f = { "<cmd>Telescope find_files<CR>", "File names" },
        g = { "<cmd>Telescope live_grep<CR>", "Live grep" },
        r = { "<cmd>Telescope registers<CR>", "Registers" },
        k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
        o = { "<cmd>Telescope oldfiles<CR>", "Oldfiles" },
        m = { "<cmd>Telescope man_pages<CR>", "Man pages" },
        c = { "<cmd>Telescope command_history<CR>", "Command history" },
    },
    ["<leader>l"] = {
        name = "+lsp",
        s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document symbols" },
        w = { "<cmd>Telescope lsp_workspace_symbols<CR>", "Workspace symbols" },
        f = { "<cmd>Telescope lsp_definitions<CR>", "Definitions" },
        t = { "<cmd>Telescope lsp_type_definitions<CR>", "Type definitions" },
        d = { "<cmd>Telescope diagnostics bufnr=0<CR>", "Diagnostics" },
        r = { "<cmd>Telescope lsp_references<CR>", "References" },
        e = { "<cmd>Telescope treesitter<CR>", "Treesitter" },
    },
    ["<leader>b"] = {
        name = "+buffer",
        p = { "<cmd>BufferLinePick<CR>", "Pick buffer" },
        n = { "<cmd>BufferLineCycleNext<CR>", "Next buffer" },
        m = { "<cmd>BufferLineCycleNext<CR>", "Previous buffer" },
    },
    ["<leader>u"] = {
        name = "+undo",
        d = { "<cmd>UndotreeToggle<CR>", "Undo tree" },
        f = { "<cmd>Telescope undo<CR>", "Find undo" }
    },
    ["<leader>o"] = {
        name = "+outline",
        l = { "<cmd>AerialToggle right<CR>", "Outline" },
    },
    ["<leader>n"] = {
        name = "+notify",
        d = { function() notify.dismiss() end, "Dismiss notifications" },
    }
})
