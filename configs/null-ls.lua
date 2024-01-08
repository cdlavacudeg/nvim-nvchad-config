local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettier.with {
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "css",
      "scss",
      "less",
      "html",
      "json",
      "jsonc",
      "yaml",
      "markdown",
    },
  },

  -- diagnostics
  b.diagnostics.eslint.with {
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
  },

  -- -- Lua
  b.formatting.stylua,

  -- -- Go
  -- go install mvdan.cc/gofumpt@latest
  b.formatting.gofumpt,
  -- go install -v github.com/incu6us/goimports-reviser/v3@latest
  b.formatting.goimports_reviser,
  -- go install github.com/segmentio/golines@latest
  b.formatting.golines,

  -- Terraform
  b.formatting.terraform_fmt,
  b.diagnostics.terraform_validate,
}

local autocomandgroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = autocomandgroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = autocomandgroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr }
      end,
    })
  end
end

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}
