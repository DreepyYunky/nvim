return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		--[[ opts = {
			auto_install = true,
			ensure_installed = { "lua_ls", "clangd", "ols" },
		}, ]]
		config = function()
			local servers = { "lua_ls", "clangd", "ols" }
			require("mason-lspconfig").setup({ auto_install = true, ensure_installed = servers })
			local mason_lspconfig = require 'mason-lspconfig'

			mason_lspconfig.setup_handlers {
				function(server_name)
					require('lspconfig')[server_name].setup {
						capabilities = capabilities,
						on_attach = on_attach,
						settings = servers[server_name],
						filetypes = (servers[server_name] or {}).filetypes,
					}
				end,
			}
		end
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			--local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local lsp = require("lspconfig")

			vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
			if vim.lsp.buf.fomat then vim.notify("Formatted!") end
			lsp.lua_ls.setup {
				settings = {
					Lua = {
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { 'vim' },
						},
					},
				},
			}

			lsp.gdscript.setup {
				force_setup = true,
				cmd = { 'ncat', '127.0.0.1', '6005' }, -- the important trick for Windows!
				root_dir = require('lspconfig.util').root_pattern('project.godot', '.git'),
				filetypes = { 'gd', 'gdscript', 'gdscript3' }
			}
			lsp.ols.setup {}
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●"
				}
			})
			local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }

			for name, icon in pairs(symbols) do
				local hl = "DiagnosticSign" .. name
				vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
			end
		end
	},
	{
		"SmiteshP/nvim-navic",
		lazy = true,
		config = function()
			local kinds = {
				Array = " ",
				Boolean = " ",
				Class = " ",
				Color = " ",
				Constant = " ",
				Constructor = " ",
				Enum = " ",
				EnumMember = " ",
				Event = " ",
				Field = " ",
				File = " ",
				Folder = "󰉋 ",
				Function = " ",
				Interface = " ",
				Key = " ",
				Keyword = " ",
				Method = " ",
				-- Module = " ",
				Module = " ",
				Namespace = " ",
				Null = "󰟢 ",
				Number = " ",
				Object = " ",
				Operator = " ",
				Package = " ",
				Property = " ",
				Reference = " ",
				Snippet = " ",
				String = " ",
				Struct = " ",
				Text = " ",
				TypeParameter = " ",
				Unit = " ",
				Value = " ",
				Variable = " ",
			}
			require("nvim-navic").setup {
				icons = kinds,
				highlight = true,
				lsp = { auto_attach = true },
				click = true,
				separator = " " .. icons.ui.ChevronRight .. " ",
				depth_limit = 0,
				depth_limit_indicator = "..",
			}
		end
	}
}
