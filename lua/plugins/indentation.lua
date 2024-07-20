return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VimEnter",
		ft = {"", "odin"},
		config = function()
			require("ibl").setup()
		end,
	},
}
