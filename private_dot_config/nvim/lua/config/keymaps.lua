local whichkey = require("which-key")
local notify = require("notify")

whichkey.add({
    {
        mode = { "n", "v" },

        { "<leader>b", group = "buffer" },
        { "<leader>bm", "<cmd>BufferLineCycleNext<CR>", desc = "Previous buffer" },
        { "<leader>bn", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
        { "<leader>bp", "<cmd>BufferLinePick<CR>", desc = "Pick buffer" },

        { "<leader>f", group = "find" },
        { "<leader>fc", "<cmd>Telescope command_history<CR>", desc = "Command history" },
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "File names" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
        { "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
        { "<leader>fm", "<cmd>Telescope man_pages<CR>", desc = "Man pages" },
        { "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Oldfiles" },
        { "<leader>fr", "<cmd>Telescope registers<CR>", desc = "Registers" },
        { "<leader>fs", "<cmd>NvimTreeToggle<CR>", desc = "File system tree" },

        { "<leader>l", group = "lsp" },
        { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Diagnostics" },
        { "<leader>le", "<cmd>Telescope treesitter<CR>", desc = "Treesitter" },
        { "<leader>lf", "<cmd>Telescope lsp_definitions<CR>", desc = "Definitions" },
        { "<leader>lr", "<cmd>Telescope lsp_references<CR>", desc = "References" },
        { "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Document symbols" },
        { "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Type definitions" },
        { "<leader>lw", "<cmd>Telescope lsp_workspace_symbols<CR>", desc = "Workspace symbols" },

        { "<leader>n", group = "notify" },
        { "<leader>nd",function() notify.dismiss() end, desc = "Dismiss notifications" },

        { "<leader>o", group = "outline" },
        { "<leader>ol", "<cmd>AerialToggle right<CR>", desc = "Outline" },

        { "<leader>u", group = "undo" },
        { "<leader>ud", "<cmd>UndotreeToggle<CR>", desc = "Undo tree" },
        { "<leader>uf", "<cmd>Telescope undo<CR>", desc = "Find undo" },
    },
})
