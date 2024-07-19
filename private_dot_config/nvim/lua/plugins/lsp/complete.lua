return {
    {
        "L3MON4D3/LuaSnip", version = "v2.*",
        build = "make install_jsregexp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
        },

        config = function()
            require("luasnip").config.set_config({
                enable_autosnippets = true,
                store_selection_keys = "<Tab>",
                update_events = "TextChanged,TextChangedI",
            })
			require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/LuaSnip/" })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        version = false,
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
            "L3MON4D3/LuaSnip",

            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-document-symbol",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "ray-x/cmp-treesitter",
            "onsails/lspkind.nvim",
        },

        opts = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            local servers = {
                "clangd",
                "lua_ls"
            }
            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup {
                    capabilities = capabilities
                }
            end

            local cmp = require("cmp")
			local luasnip = require("luasnip")
            local lspkind = require("lspkind")
			require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/LuaSnip/" })

            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources(
                    {
                        { name = 'path' }
                    },
                    {
                        { name = 'cmdline' }
                    }
                ),
                matching = { disallow_symbol_nonprefix_matching = false }
            })

            return {
                sources = cmp.config.sources(
                    {
                        { name = "luasnip" },
                        { name = "nvim_lsp" },
                        { name = "nvim_lsp_signature_help" },
                        -- { name = "treesitter" }
                    }
                ),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                view = {
                    docs = { auto_open = true },
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
						luasnip.lsp_expand(args.body)
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
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						elseif luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						elseif luasnip.locally_jumpable(1) then
							luasnip.jump_next()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump_prev()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function (entry, vim_item)
                        local item = lspkind.cmp_format({
                            mode = "symbol_text",
                            maxwidth = 999,
                            ellipsis_char = "",
                            before = function (entry2, item)
                                local width = math.floor(0.3 * vim.api.nvim_win_get_width(0))
                                -- delete last character if it's '~'
                                if string.sub(item.abbr, -1) == "~" then
                                    item.abbr = string.sub(item.abbr, 1, -2)
                                end
                                if #item.abbr > width then
                                    item.abbr = string.sub(item.abbr, 1, width)
                                    item.menu = "󰇘"
                                else
                                    item.menu = " "
                                end
                                return item
                            end
                        })(entry, vim_item)

                        local str = vim.split(item.kind, "%s", { trimempty = true })
                        item.kind = (str[1] or "") .. " " .. string.sub((str[2] or ""), 1, 4)
                        return item
                    end
				},
            }
        end
    }
}
