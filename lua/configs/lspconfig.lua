local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = { "html", "cssls", "pyright", "ruff", "clangd", "rust_analyzer", "svelte",
  "gopls", "golangci_lint_ls", "ty" }


local on_attach = function(client, bufnr)
  -- Call the default on_attach function
  require("nvchad.configs.lspconfig").on_attach(client, bufnr)
  local config = {
    -- disable virtual text
    virtual_text = false,
    virtual_lines = false,
    -- show signs
    update_in_insert = true,
    underline = {
      severity = "ERROR",
    },
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }


  vim.diagnostic.config(config)
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
end

vim.lsp.config("ts_ls", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
})



-- golang
vim.lsp.config("gopls", {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    vim.bo[bufnr].tabstop = 4
    vim.bo[bufnr].shiftwidth = 4
    vim.bo[bufnr].expandtab = true
  end,
  on_init = on_init,
  capabilities = capabilities,
})

vim.lsp.enable(servers)
vim.lsp.enable("ts_ls")
