return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VimEnter",
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"echasnovski/mini.indentscope",
		event = "LazyFile",
		opts = {}
	}
}
