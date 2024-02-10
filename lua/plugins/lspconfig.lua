return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({ PATH = "prepend" })
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
			lsp.gdscript.setup({})
		end


	},
}
