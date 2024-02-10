return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	run = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {"c", "cpp", "lua", "odin", "javascript", "typescript"},
			highlight = {enabled = true},
			indent = {enabled = true},
		})
	end
}
