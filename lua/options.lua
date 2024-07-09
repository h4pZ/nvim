require "nvchad.options"

-- add yours here!

local o = vim.o
o.timeoutlen = 100
o.relativenumber = true

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)

-- o.cursorlineopt ='both' -- to enable cursorline!
