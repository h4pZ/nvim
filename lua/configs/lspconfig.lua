-- EXAMPLE
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "pyright", "ruff", "clangd", "rust_analyzer", "vscode-html-language-server", }


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
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
