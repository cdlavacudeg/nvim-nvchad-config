local opt = vim.opt

-- Numbers
opt.relativenumber = true
opt.textwidth = 120
opt.tabstop = 2
opt.shiftwidth = 2

-- codium

vim.g.codeium_disable_bindings = true
vim.g.codeium_no_map_tab = true

-- Treesiter folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
-- Always open folds
opt.foldlevel = 99
