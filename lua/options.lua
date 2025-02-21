require "nvchad.options"

-- add yours here!

local o = vim.o
o.timeoutlen = 100
o.relativenumber = true

-- Set default indentation to 4 spaces
o.shiftwidth = 4
o.tabstop = 4
o.expandtab = true


local opts = { noremap = true, silent = true }
vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)

-- o.cursorlineopt ='both' -- to enable cursorline!
