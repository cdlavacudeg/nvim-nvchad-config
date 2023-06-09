-- Accept current suggestion
vim.keymap.set("i", "<C-]>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true })

-- Next suggestion
vim.keymap.set("i", "<A-]>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true })

-- Previous suggestion
vim.keymap.set("i", "<A-[>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true })

-- Clear current suggestion
vim.keymap.set("i", "<C-[>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true })

-- Manually trigger suggestion
vim.keymap.set("i", "<A-Bslash>", function()
  return vim.fn["codeium#Complete"]()
end, { expr = true })
