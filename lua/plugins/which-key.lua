return {
	"folke/which-key.nvim",
	config = function ()
		local wk = require("which-key")
		wk.register({
			["leader"] = {
				f = {
					name = "Finder for telescope",
					g = "Live Grep",
					f = "Find files"
				}
			}
		})
	end
}
