vim.g.loaded_netrw = false
vim.g.loaded_netrwPlugin = false

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.wo.wrap = false

vim.wo.number = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "o" })
	end,
})

vim.keymap.set("v", "<leader>y", '"*y', { desc = "Copy selection to system clipboard" })
vim.keymap.set("n", "<leader>p", '"*p', { desc = "Paste selection from system clipboard before cursor" })
vim.keymap.set("n", "<leader>P", '"*P', { desc = "Paste selection from system clipboard after cursor" })

vim.keymap.set("n", "U", "<C-r>", { desc = "Redo change" })
