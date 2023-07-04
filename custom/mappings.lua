local M = {}

M.general = {
  i = {
    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "beginning of line" },
    ["<C-e>"] = { "<End>", "end of line" },
    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "move left" },
    ["<C-l>"] = { "<Right>", "move right" },
    ["<C-j>"] = { "<Down>", "move down" },
    ["<C-k>"] = { "<Up>", "move up" },
  },
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    -- Resize window
    ["<C-Up>"] = { ":resize -2<CR>", "Resize window up" },
    ["<C-Down>"] = { ":resize +2<CR>", "Resize window down" },
    ["<C-Left>"] = { ":vertical resize +2 <CR>", "Resize window left" },
    ["<C-Right>"] = { ":vertical resize -2 <CR>", "Resize window right" },
    -- Move text
    ["<A-j>"] = { ":m .+1<CR>==", "Move text Up" },
    ["<A-k>"] = { ":m '.-2<CR>==", "Move text Down" },
    -- Delete without overwriting register --
    ["<leader>d"] = { '"_d' },
    ["<leader>D"] = { '"_d' },
    -- line numbers
    ["<leader>n"] = { "<cmd> set nu! <CR>", "toggle line number" },
    ["<leader>rn"] = { "<cmd> set rnu! <CR>", "toggle relative number" },

    -- -- save
    -- ["<C-s>"] = { "<cmd> w <CR>", "save file" },

    -- Copy all
    -- ["<C-c>"] = { "<cmd> %y+ <CR>", "copy whole file" },
  },
  v = {
    -- Move text
    ["<A-j>"] = { ":m '>+1<CR>gv==gv", "Move text Up" },
    ["<A-k>"] = { ":m '<.-2<CR>gv==gv", "Move text Down" },
    -- Delete without overwriting register --
    ["<leader>d"] = { '"_d' },
    ["<leader>D"] = { '"_d' },
  },
  x = {
    ["<A-j>"] = { ":m '>+1<CR>gv==gv", "Move text Up" },
    ["<A-k>"] = { ":m '<.-2<CR>gv==gv", "Move text Down" },
    -- Delete without overwriting register --
    ["<leader>d"] = { '"_d' },
    ["<leader>D"] = { '"_d' },
  },
}

-- more keybinds!
--
M.lspconfig = {
  n = {
    ["<leader>f"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "lsp formatting",
    },
    ["<leader>fm"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    ["<C-n>"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
  },
}

-- M.dap = {
--   plugin = true,
--   n = {
--     ["<leader>za"] = { "<cmd>lua require'dap'.toggle_breakpoint() <CR>", "DAP toggle breakpoint" },
--     -- ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<CR>", "DAP continue" },
--     -- ["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<CR>", "DAP toggle repl" },
--     -- ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<CR>", "DAP step over" },
--     -- ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<CR>", "DAP step into" },
--     -- ["<leader>du"] = { "<cmd>lua require'dap'.step_out()<CR>", "DAP step out" },
--     -- ["<leader>dus"] = {
--     --   function()
--     --     local widgets = require "dap.ui.widgets"
--     --     local sidebar = widgets.sidebar(widgets.scopes)
--     --     sidebar.open()
--     --   end,
--     --   "DAP open debugging sidebar",
--     -- },
--   },
-- }
--
-- M.dap_go = {
--   plugin = true,
--   n = {
--     ["<leader>dgt"] = {
--       function()
--         require("dap-go").debug_test()
--       end,
--       "Debug go test",
--     },
--     ["<leader>dgl"] = {
--       function()
--         require("dap-go").debug_last()
--       end,
--       "Debug last go test",
--     },
--   },
-- }

return M
