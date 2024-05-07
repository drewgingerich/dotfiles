vim.g.loaded_netrw = false
vim.g.loaded_netrwPlugin = false

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.wo.wrap = false

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
