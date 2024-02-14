return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
    	require("lualine").setup {
		icons_enabled = true,
		theme = "github_dark_tritanopia"
	}
    end
}
