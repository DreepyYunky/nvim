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
		opts = {
			auto_install = true,
			ensure_installed = { "lua_ls", "clangd", "ols" },
		},
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
				cmd = { 'ncat', '127.0.0.1', '6008' }, -- the important trick for Windows!
				root_dir = require('lspconfig.util').root_pattern('project.godot', '.git'),
				filetypes = { 'gd', 'gdscript', 'gdscript3' }
			}
			lsp.ols.setup {}
			local M = {}
			M.icons = {
				Class = " ",
				Color = " ",
				Constant = " ",
				Constructor = " ",
				Enum = " ",
				EnumMember = " ",
				Field = "󰄶 ",
				File = " ",
				Folder = " ",
				Function = " ",
				Interface = "󰜰",
				Keyword = "󰌆 ",
				Method = "ƒ ",
				Module = "󰏗 ",
				Property = " ",
				Snippet = "󰘍 ",
				Struct = " ",
				Text = " ",
				Unit = " ",
				Value = "󰎠 ",
				Variable = " ",
			}
			function M.setup()
				local kinds = vim.lsp.protocol.CompletionItemKind
				for i, kind in ipairs(kinds) do
					kinds[i] = M.icons[kind] or kind
				end
			end

			return M
		end
	},
}
