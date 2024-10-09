local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "scss",
    "sql",
    "tsx",
    "javascript",
    "typescript",
    "dockerfile",
    "dot",
    "yaml",
    "json",
    "markdown",
    "python",
    "go",
    "godot_resource",
    "gomod",
    "gosum",
    "gowork",
  },
  on_config_done = function()
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.ejs = {
      install_info = {
        url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
        files = { "src/parser.c" },
        requires_generate_from_grammar = true,
      },
      filetype = "ejs",
    }
  end,
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
    "eslint-lsp",
    "eslint_d",
    "prettier",
    "json-lsp",
    -- Front
    "angular-language-server",

    -- Devops
    "yaml-language-server",
    "dot-language-server",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "terraform-ls",
    "tflint",

    -- Go
    "gopls",
    "goimports-reviser",
    "gofumpt",
    "golines",
    "golangci-lint-langserver",
    "delve",
    "json-to-struct",

    -- Python
    "pyright",
    "mypy",
    "ruff",
    "black"
  },
}

-- Nvim tree config
M.nvimtree = {
  disable_netrw = false,
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
    timeout = 1000,
  },
  diagnostics = {
    enable = true,
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  view = {
    width = 30,
  },
  renderer = {
    root_folder_modifier = ":t",
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}

-- gitsigns
M.gitsigns = {
  signs                        = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged                 = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged_enable          = true,
  signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl                        = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl                       = true, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir                 = {
    follow_files = true,
  },
  attach_to_untracked          = true,
  current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts      = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  sign_priority                = 6,
  update_debounce              = 100,
  status_formatter             = nil, -- Use default
  auto_attach                  = true,
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  max_file_length              = 40000, -- Disable if file is longer than this (in lines)
  preview_config               = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
}

return M
