local overrides = require "custom.plugins.overrides"

return {

  -- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard
  ["folke/which-key.nvim"] = { disable = false },
  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- override plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  -- ["kyazdani42/nvim-tree.lua"] = {
  --   override_options = overrides.nvimtree,
  -- },

  ["lewis6991/gitsigns.nvim"] = {
    ft = nil,
    override_options = overrides.gitsigns,
  },

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  ["Exafunction/codeium.vim"] = {
    config = function()
      require "custom.plugins.codeium"
    end,
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- Debugging
  -- ["mfussenegger/nvim-dap"] = {
  --   config = function(_, opts)
  --     require("dap").setup(opts)
  --   end,
  -- },
  --
  -- -- Go (delve)
  -- -- go install github.com/go-delve/delve/cmd/dlv@latest
  -- ["leoluz/nvim-dap-go"] = {
  --   ft = "go",
  --   dependencies = "mfussenegger/nvim-dap",
  --   config = function(_, opts)
  --     require("dap-go").setup(opts)
  --   end,
  -- },
  --
  -- -- dap ui
  -- ["rcarriga/nvim-dap-ui"] = {
  --   dependencies = "mfussenegger/nvim-dap",
  --   config = function()
  --     require("dapui").setup()
  --   end,
  -- },
  --
  -- -- Js Node (nvim-dap-vscode-js)
  -- ["mxsdev/nvim-dap-vscode-js"] = {
  --   dependencies = "mfussenegger/nvim-dap",
  --   config = function()
  --     require("dap-vscode-js").setup()
  --   end,
  -- },
  --
  -- ["microsoft/vscode-js-debug"] = {
  --   opt = true,
  --   run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  -- },
  --
  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}
