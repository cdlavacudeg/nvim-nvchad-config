vim.g.copilot_no_tab_map = true
-- Change Tab to <C-g> to avoid conflict with other plugins
vim.keymap.set('i', '<C-g>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
  desc = "Copilot: Accept suggestion",
})

-- Next suggestion
vim.keymap.set('i', '<C-)>', '<Plug>(copilot-next)', {
  desc = "Copilot: Next suggestion",
});
-- Previous suggestion
vim.keymap.set('i', '<C-*>', '<Plug>(copilot-previous)', {
  desc = "Copilot: Previous suggestion",
});
