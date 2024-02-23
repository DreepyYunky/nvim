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
			local capabilities = require("cmp_nvim_lsp").capabilities
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


			lsp.gdscript.setup {
				force_setup = true,
				cmd = { 'ncat', '127.0.0.1', '6008' }, -- the important trick for Windows!
				root_dir = require('lspconfig.util').root_pattern('project.godot', '.git'),
				filetypes = { 'gd', 'gdscript', 'gdscript3' }
			}
			lsp.ols.setup {}
			local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
				vim.diagnostic.config({
					virtual_text = {
						prefix = "●",
					},
					signs = true,
					underline = true,
					update_in_insert = false,
					severity_sort = false,
				})
			end
		end
	},
}
