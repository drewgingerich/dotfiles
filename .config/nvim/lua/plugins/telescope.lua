return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope_fns = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", telescope_fns.find_files, {})
			vim.keymap.set("n", "<leader>fg", telescope_fns.live_grep, {})
			vim.keymap.set("n", "<leader>fb", telescope_fns.buffers, {})
			vim.keymap.set("n", "<leader>fh", telescope_fns.help_tags, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
				pickers = {
					find_files = {
						hidden = true,
					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
}
