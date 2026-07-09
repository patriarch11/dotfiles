vim.opt.guicursor = "i:block"
vim.opt.cursorline = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.colorcolumn = "100"
vim.opt.listchars = "tab: ,multispace:|   ,eol:󰌑"
vim.opt.winborder = "rounded"
vim.opt.clipboard = "unnamedplus"
vim.o.termguicolors = true
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.o.showmode = false
vim.o.cmdheight = 0

vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldtext = ""
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.opt.scrolloff = 8

vim.g.mapleader = " "

vim.cmd.colorscheme("vscode")
if vim.o.background == "dark" then
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2d2e" })
end

