local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "typescript",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
  },
}

-- Nvim tree config
M.nvimtree = {
  -- disable_netrw = false,
  -- open_on_setup = true,
  sync_root_with_cwd = false,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  view = {
    width = 30,
    hide_root_folder = false,
  },
}

return M
