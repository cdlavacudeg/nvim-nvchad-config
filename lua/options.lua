require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
local opt = vim.opt

-- Numbers
opt.relativenumber = true
opt.textwidth = 120
opt.tabstop = 2
opt.shiftwidth = 2

-- Treesiter folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
-- Always open folds
opt.foldlevel = 99
