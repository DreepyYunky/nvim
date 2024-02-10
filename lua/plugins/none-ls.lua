return {
	"nvimtools/none-ls.nvim",
	config = function ()
		local null = require("null-ls")
		null.setup({
			null.builtins.formatting.clangd
		})
	end
}
