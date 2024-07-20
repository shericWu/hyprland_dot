local whichkey = require("which-key")
local notify = require("notify")

vim.keymap.set({ "n", "v" }, "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover" })
-- vim.api.nvim_set_keymap("i", "<A-z>", "<Plug>(Tabout)", { silent = true })

whichkey.add({
    {
        mode = { "n", "v" },

        { "<leader>b", group = "Buffer" },
        { "<leader>bm", "<cmd>BufferLineCycleNext<CR>", desc = "Previous buffer" },
        { "<leader>bn", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
        { "<leader>bp", "<cmd>BufferLinePick<CR>", desc = "Pick buffer" },

        { "<leader>f", group = "Find" },
        { "<leader>fc", "<cmd>Telescope command_history<CR>", desc = "Command history" },
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "File names" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
        { "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
        { "<leader>fm", "<cmd>Telescope man_pages<CR>", desc = "Man pages" },
        { "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Oldfiles" },
        { "<leader>fr", "<cmd>Telescope registers<CR>", desc = "Registers" },
        { "<leader>fs", "<cmd>NvimTreeToggle<CR>", desc = "File system tree" },

        { "<leader>l", group = "Telescope lsp" },
        { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Diagnostics" },
        { "<leader>le", "<cmd>Telescope treesitter<CR>", desc = "Treesitter" },
        { "<leader>lf", "<cmd>Telescope lsp_definitions<CR>", desc = "Definitions" },
        { "<leader>lr", "<cmd>Telescope lsp_references<CR>", desc = "References" },
        { "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Document symbols" },
        { "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Type definitions" },
        { "<leader>lw", "<cmd>Telescope lsp_workspace_symbols<CR>", desc = "Workspace symbols" },

        { "<leader>n", group = "Notify" },
        { "<leader>nd", function() notify.dismiss() end, desc = "Dismiss notifications" },

        { "<leader>o", group = "Outline" },
        { "<leader>ol", "<cmd>AerialToggle right<CR>", desc = "Outline" },

        { "<leader>u", group = "Undo" },
        { "<leader>ud", "<cmd>UndotreeToggle<CR>", desc = "Undo tree" },
        { "<leader>uf", "<cmd>Telescope undo<CR>", desc = "Find undo" },

        { "<leader>d", group = "LSP" },
        { "<leader>da", "<cmd>Lspsaga code_action<CR>", desc = "Code action" },
        { "<leader>df", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek definition" },
        { "<leader>dt", "<cmd>Lspsaga peek_type_definition<CR>", desc = "Peek type" },
        { "<leader>dn", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next diagnostic" },
        { "<leader>dp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Previous diagnostic" },
        { "<leader>dd", "<cmd>Lspsaga show_buf_diagnostics ++normal<CR>", desc = "Show buffer diagnostic" },
        { "<leader>ds", "<cmd>Lspsaga finder<CR>", desc = "Show reference" },
        { "<leader>dk", "<cmd>Lspsaga hover_doc ++keep<CR>", desc = "Keep hover" },
        { "<leader>do", "<cmd>Lspsaga outline<CR>", desc = "Outline" },
        { "<leader>dr", "<cmd>Lspsaga rename<CR>", desc = "Rename" },

        { "<leader>t", "<cmd>Lspsaga term_toggle<CR>", desc = "Toggle terminal" },
        { "<leader>mm", function() require("conform").format({ lsp_fallback = true, async = true }) end, desc = "Format" },

    },
})
