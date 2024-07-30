local whichkey = require("which-key")
local notify = require("notify")

vim.keymap.set({ "n", "v" }, "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover" })
-- vim.api.nvim_set_keymap("i", "<A-z>", "<Plug>(Tabout)", { silent = true })

whichkey.add({
    {
        mode = { "n", "v" },

        { "<leader>b", group = "Buffer" },
        { "<leader>bm", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
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

        { "<leader>t", group = "Telescope lsp" },
        { "<leader>td", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Diagnostics" },
        { "<leader>te", "<cmd>Telescope treesitter<CR>", desc = "Treesitter" },
        { "<leader>tf", "<cmd>Telescope lsp_definitions<CR>", desc = "Definitions" },
        { "<leader>tr", "<cmd>Telescope lsp_references<CR>", desc = "References" },
        { "<leader>ts", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Document symbols" },
        { "<leader>tt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Type definitions" },
        { "<leader>tw", "<cmd>Telescope lsp_workspace_symbols<CR>", desc = "Workspace symbols" },

        { "<leader>n", group = "Notify" },
        { "<leader>nd", function() notify.dismiss() end, desc = "Dismiss notifications" },

        { "<leader>o", group = "Outline" },
        { "<leader>ol", "<cmd>AerialToggle right<CR>", desc = "Outline" },

        { "<leader>u", group = "Undo" },
        { "<leader>ud", "<cmd>UndotreeToggle<CR>", desc = "Undo tree" },
        { "<leader>uf", "<cmd>Telescope undo<CR>", desc = "Find undo" },

        { "<leader>l", group = "LSP" },
        { "<leader>la", "<cmd>Lspsaga code_action<CR>", desc = "Code action" },
        { "<leader>lf", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek definition" },
        { "<leader>lt", "<cmd>Lspsaga peek_type_definition<CR>", desc = "Peek type" },
        { "<leader>ln", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next diagnostic" },
        { "<leader>lp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Previous diagnostic" },
        { "<leader>ld", "<cmd>Lspsaga show_buf_diagnostics ++normal<CR>", desc = "Show buffer diagnostic" },
        { "<leader>ls", "<cmd>Lspsaga finder<CR>", desc = "Show reference" },
        { "<leader>lk", "<cmd>Lspsaga hover_doc ++keep<CR>", desc = "Keep hover" },
        { "<leader>lo", "<cmd>Lspsaga outline<CR>", desc = "Outline" },
        { "<leader>lr", "<cmd>Lspsaga rename<CR>", desc = "Rename" },

        { "<leader>q", "<cmd>Lspsaga term_toggle<CR>", desc = "Toggle terminal" },

        { "<leader>mm", function() require("conform").format({ lsp_fallback = true, async = true }) end, desc = "Format" },

        { "<leader>d", group = "Debug" },
        { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
        { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
        { "<leader>dr", function() require("dap").run_to_cursor() end, desc = "Run to cursor" },
        { "<leader>di", function() require("dap").step_into() end, desc = "Step into" },
        { "<leader>do", function() require("dap").setp_out() end, desc = "Step out" },
        { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
        { "<leader>dt", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
        { "<leader>dq", function() require("dap").terminate() end, desc = "Terminate" },
        { "<leader>dl", function() require("dap").run_last() end, desc = "Run last" },
        { "<leader>ds", function() require("dap").session() end, desc = "Session" },
        { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },
})
