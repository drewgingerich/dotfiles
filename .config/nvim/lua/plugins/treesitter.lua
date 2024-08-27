return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			auto_install = true,
			highlight = {
				enable = true,
				disable = { "dockerfile" },
			},
			indent = { enable = true },
		})
	end,
}
