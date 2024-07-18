return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",

        config = function()
            require("luasnip").config.set_config({
                enable_autosnippets = true,
                store_selection_keys = "<Tab>",
                update_events = "TextChanged,TextChangedI",
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        version = false,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-document-symbol",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "ray-x/cmp-treesitter",
            -- "onsails/lspkind.nvim",
            "nvim-treesitter/nvim-treesitter",
        },

        opts = function()
            local cmp = require("cmp")
			local luasnip = require("luasnip")
            -- local lspkind = require("lspkind")
			require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/LuaSnip/" })

            return {
                sources = cmp.config.sources({
                    { name = "luasnip" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "nvim_lsp" },
                    { name = "treesitter" }
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                view = {
                    -- docs = { auto_open = true },
                    entries = {
                        name = "custom",
                        selection_order = "near_cursor"
                    }
                },
                experimental = {
                    ghost_text = true,
                },
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehaviorReplace }),
					["<C-L>"] = cmp.mapping.abort(),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if #cmp.get_entries() == 1 then
								cmp.confirm({ select = true, behavior = cmp.ConfirmBehaviorReplace })
							end
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif luasnip.jumpable(1) then
							luasnip.jump_next()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
						elseif luasnip.jumpable(-1) then
							luasnip.jump_prev()
						else
							fallback()
						end
					end),
				}),
				-- formatting = {
				-- 	format = lspkind.cmp_format({
				-- 		mode = "symbol",
				-- 		maxwidth = function()
				-- 			return math.floor(0.4 * vim.o.columns)
				-- 		end,
				-- 		ellipsis_char = "...",
				-- 		show_labelDetails = true,
				-- 		before = function(entry, vim_item)
				-- 			-- ...
				-- 			-- vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
				-- 			return vim_item
				-- 		end,
				-- 	}),
				-- },
            }
        end
    }
}
