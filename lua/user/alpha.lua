local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

require("alpha.term")

local dashboard = require("alpha.themes.dashboard")

-- Terminal header
dashboard.section.terminal.command = "cat | animated_lolcat.sh " .. os.getenv("HOME") .. "/.config/nvim/static/neovim.cat"
dashboard.section.terminal.width = 40
dashboard.section.terminal.height = 24


local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "AlphaButtonText"
  b.opts.hl_shortcut = "AlphaButtonShortcut"
  return b
end


dashboard.section.buttons.val = {
    button("f", "  Find file", ":Telescope find_files <CR>"),
    button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    button("p", "  Find project", ":Telescope projects <CR>"),
    button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    button("t", "  Find text", ":Telescope live_grep <CR>"),
    button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
    button("q", "  Quit Neovim", ":qa<CR>"),
}



local function footer()
-- NOTE: requires the fortune-mod package to work
    -- local handle = io.popen("fortune")
    -- local fortune = handle:read("*a")
    -- handle:close()
    -- return fortune
    local version = vim.version()
    return " v" .. version.major .. "." .. version.minor .. "." .. version.patch
end

dashboard.section.footer.val = {
    " h 4 p Z",
    "",
    footer()
}
dashboard.section.footer.opts.hl = "AlphaFooter"

--[[ dashboard.section.footer.opts.hl = "Type" ]]
--[[ dashboard.section.header.opts.hl = "Include" ]]
--[[ dashboard.section.buttons.opts.hl = "Keyword" ]]

dashboard.opts.opts.noautocmd = true

-- Layout
dashboard.config.layout = {
  { type = "padding", val = 1 },
  dashboard.section.terminal,
  { type = "padding", val = 5 },
  dashboard.section.buttons,
  { type = "padding", val = 1 },
  dashboard.section.footer,
}


-- Highlight groups for alpha dashboard.
vim.cmd('hi AlphaButtonText guifg=#575268')
vim.cmd('hi AlphaFooter guifg=#434369')
vim.cmd('hi AlphaButtonShortcut guibg=None guifg=#8E87ED')
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
