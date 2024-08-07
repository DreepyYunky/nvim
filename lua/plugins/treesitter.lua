return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	run = ":TSUpdate",
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
	config = function()
		require('nvim-treesitter.configs').setup {
			-- Add languages to be installed here that you want installed for treesitter
			ensure_installed = { 'c', 'cpp', 'typescript', 'vimdoc', 'vim', 'bash' },
			highlight = {enable =true},
			indent = {enable = true},
			-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
		}
	end
}
