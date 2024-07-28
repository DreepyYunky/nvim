return {
	{
		"projekt0n/github-nvim-theme",
		config = function()
			vim.cmd [[colorscheme github_dark_tritanopia]]
		end
	},
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			-- Lua
			require('onedark').setup {
				-- Main options --
				style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
				code_style = {
					comments = 'none',
					keywords = 'none',
					functions = 'none',
					strings = 'none',
					variables = 'none'
				},

			}
		end
	}
}
