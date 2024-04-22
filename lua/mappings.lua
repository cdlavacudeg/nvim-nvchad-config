local M = {}

M.general = {
  i = {
    -- Go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "beginning of line" },
    ["<C-e>"] = { "<End>", "end of line" },
    -- Navigate within insert mode
    ["<C-h>"] = { "<Left>", "move left" },
    ["<C-l>"] = { "<Right>", "move right" },
    ["<C-j>"] = { "<Down>", "move down" },
    ["<C-k>"] = { "<Up>", "move up" },
  },
  n = {
    -- [";"] = { ":", "command mode", opts = { nowait = true } },
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
    ["<leader>y"] = { '"+y' },
    ["<leader>Y"] = { '"+Y' },
    ["<leader>p"] = { '"_dP' },
    -- line numbers
    ["<leader>n"] = { "<cmd> set nu! <CR>", "toggle line number" },
    ["<leader>rn"] = { "<cmd> set rnu! <CR>", "toggle relative number" },

    -- Copy all
    ["<C-c>"] = { "<cmd> %y+ <CR>", "copy whole file" },

    -- Vertical movement
    ["<C-d>"] = { "<C-d>zz", "scroll down and center view" },
    ["<C-u>"] = { "<C-u>zz", "scroll up and center view" },
    ["n"] = { "nzzzv", "Searching and center view and unfold" },
    ["N"] = { "Nzzzv", "Searching and center view and unfold" },
  },
  v = {
    -- Move text
    ["<A-j>"] = { ":m '>+1<CR>gv==gv", "Move text Up" },
    ["<A-k>"] = { ":m '<.-2<CR>gv==gv", "Move text Down" },
    -- Delete without overwriting register --
    ["<leader>d"] = { '"_d' },
    ["<leader>D"] = { '"_d' },
    ["<leader>y"] = { '"+y' },
    ["<leader>Y"] = { '"+Y' },
    ["<leader>p"] = { '"_dP' },
    -- Esc
    ["<C-c>"] = { "<ESC>", "exit visual mode" },
  },
  x = {
    ["<A-j>"] = { ":m '>+1<CR>gv==gv", "Move text Up" },
    ["<A-k>"] = { ":m '<.-2<CR>gv==gv", "Move text Down" },
    -- Delete without overwriting register --
    ["<leader>d"] = { '"_d' },
    ["<leader>D"] = { '"_d' },
    ["<leader>y"] = { '"+y' },
    ["<leader>Y"] = { '"+Y' },
    ["<leader>p"] = { '"_dP' },
    ["p"] = { "p", "paste" },
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

M.telescope = {
  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
    ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
  },
}

M.dap = {
  n = {
    ["<leader>za"] = { "<cmd>lua require'dap'.toggle_breakpoint() <CR>", "DAP toggle breakpoint" },
    ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<CR>", "DAP continue" },
    ["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<CR>", "DAP toggle repl" },
    ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<CR>", "DAP step over" },
    ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<CR>", "DAP step into" },
    ["<leader>du"] = { "<cmd>lua require'dap'.step_out()<CR>", "DAP step out" },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "DAP open debugging sidebar",
    },
  },
}

M.dap_go = {
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

M.gopher = {
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags",
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags",
    },
  },
}

-- map("i", "<C-k>", "<Up>", { desc = "Move up" })
--
-- -- multiple modes
-- map({ "i", "n" }, "<C-k>", "<Up>", { desc = "Move down" })
--
-- map("n", "<leader>ff", ":Telescope <cr>")
--
-- -- mapping with a lua function
-- map("n", "<A-i>", function()
--   require("nvchad.term").toggle({ pos = "sp", id ='abc' })
-- end, { desc = "Terminal toggle floating" })
--
--
-- -- Disable mappings
-- local nomap = vim.keymap.del
--
-- nomap("i", "<C-k>")
-- nomap("n", "<C-k>")
--
require "nvchad.mappings"

local map = vim.keymap.set

for _, maps in pairs(M) do
  for mode, data in pairs(maps) do
    for key, val in pairs(data) do
      map(mode, key, val[1], { desc = val[2] })
    end
  end
end
