require("github-theme").setup({
  theme_style = "dark_default",
  function_style = "italic",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "orange", error = "#ff0000"},

  -- Overwrite the highlight groups
  overrides = function(c)
    return {
      htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
      DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
      -- this will remove the highlight groups
      TSField = {},
    }
  end
})

-- extra stuff
vim.cmd('hi Normal guibg=#111217')

-- Gitsigns colors
vim.cmd('hi GitSignsAdd guifg=#a8f9c4 guibg=#1c1c26')
vim.cmd('hi GitSignsChange guifg=#aeb1ff guibg=#1c1c26')
vim.cmd('hi GitSignsDelete guifg=#feb8bf guibg=#1c1c26')

-- Signs handlers.lua file
vim.cmd('hi DiagnosticSignError guifg=#feb8bf')
vim.cmd('hi DiagnosticSignWarn  guifg=#ffbdf1')
vim.cmd('hi DiagnosticSignHint  guifg=#8cd7ff')
vim.cmd('hi DiagnosticSignInfo  guifg=#ffffff')

-- For the floating window background
vim.cmd('hi NormalFloat guibg=#111217')

-- For dap
vim.cmd('hi DapBreakpoint guifg=#f70067')

-- For dap-ui bars / colors.
vim.cmd('hi lualine_a_inactive guifg=#8cd7ff')
vim.cmd('hi lualine_b_inactive guifg=#8cd7ff')
vim.cmd('hi lualine_c_inactive guifg=#8cd7ff')
vim.cmd('hi DapUIScope guifg=#8cd7ff')
vim.cmd('hi DapUIType guifg=#aeb1ff')
vim.cmd('hi DapUIModifiedValue guifg=#8cd7ff')
vim.cmd('hi DapUIDecoration guifg=#8cd7ff')
vim.cmd('hi DapUIThread guifg=#a8f9c4')
vim.cmd('hi DapUIStoppedThread guifg=#8cd7ff')
vim.cmd('hi DapUISource guifg=#aeb1ff')
vim.cmd('hi DapUILineNumber guifg=#8cd7ff')
vim.cmd('hi DapUIFloatBorder guifg=#f70067')
vim.cmd('hi DapUIWatchesValue guifg=#a8f9c4')
vim.cmd('hi DapUIBreakpointsPath guifg=#8cd7ff')
vim.cmd('hi DapUIBreakpointsInfo guifg=#a8f9c4')
vim.cmd('hi DapUIBreakpointsCurrentLine guifg=#a8f9c4')
vim.cmd('hi DapUIBreakpointsLine guifg=#8cd7ff')

-- For symbols outline
vim.cmd('hi FocusedSymbol guibg=#f70067')

-- For the number color.
vim.cmd('hi CursorLineNr guifg=#a8f9c4 guibg=#1c1c26')
vim.cmd('hi LineNr guibg=#1c1c26')
vim.cmd('hi SignColumn guibg=#1c1c26')

