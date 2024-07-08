vim.o.termguicolors = true
vim.g.termguicolors = true

vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- Quick fix.
vim.cmd('hi CursorLineNr guifg=#a8f9c4')
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

