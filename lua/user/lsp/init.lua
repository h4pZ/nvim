local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.lsp-signature"
require "user.lsp.lsp-mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
-- For some reason it doesn't work.
vim.keymap.set("n", "gl", vim.diagnostic.open_float)

