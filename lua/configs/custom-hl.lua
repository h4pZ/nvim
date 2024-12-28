local M = {}

function M.set_custom_hl()
  vim.cmd('hi CursorLineNr guifg=#a8f9c4')
  vim.cmd('hi DapBreakpoint guifg=#f70067')
  vim.cmd('hi DapBreakpointCondition guifg=#f70067')
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

  vim.cmd('hi WhichKey guifg=#F8BD96')
  vim.cmd('hi WhichKeyBorder guifg=#F8BD96')
  vim.cmd('hi WhichKeyDesc guifg=#ffffff')
  vim.cmd('hi WhichKeyGroup guifg=#c7d1ff')
  vim.cmd('hi WhichKeyValue guifg=#c7d1ff')

  vim.cmd('hi SnacksDashboardHeader guifg=#f70067')
  vim.cmd('hi SnacksDashboardDesc guifg=#ebbcba')
  vim.cmd('hi SnacksDashboardIcon guifg=#ebbcba')
  vim.cmd('hi SnacksDashboardKey guifg=#f6c177')
  vim.cmd('hi SnacksDashboardFooter guifg=#f6c177')
  vim.cmd('hi SnacksDashboardNormal guifg=#f6c177')
  vim.cmd('hi SnacksDashboardSpecial guifg=#e0def4')

  -- vim.cmd('hi Normal guibg=#11111b')
  vim.cmd('hi TabLine guibg=NONE')
  vim.cmd('hi TbBufOn guibg=#191724')
  vim.cmd('hi TbBufOnClose guibg=#191724')
  vim.cmd('hi TbBufOnModified guibg=#191724')
end

return M
