local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup{
    transparent_background = true,
term_colors = false,
styles = {
	comments = "NONE",
	functions = "NONE",
	keywords = "NONE",
	strings = "NONE",
	variables = "NONE",
},
integrations = {
	treesitter = true,
	native_lsp = {
		enabled = true,
		virtual_text = {
			errors = "NONE",
			hints = "NONE",
			warnings = "NONE",
			information = "NONE",
		},
		underlines = {
			errors = "underline",
			hints = "underline",
			warnings = "underline",
			information = "underline",
		},
	},
	lsp_trouble = false,
	cmp = true,
	lsp_saga = false,
	gitgutter = false,
	gitsigns = true,
	telescope = true,
	nvimtree = {
		enabled = true,
		show_root = false,
		transparent_panel = true,
	},
	neotree = {
		enabled = false,
		show_root = false,
		transparent_panel = false,
	},
	which_key = false,
	indent_blankline = {
		enabled = true,
		colored_indent_levels = true,
	},
	dashboard = true,
	neogit = false,
	vim_sneak = false,
	fern = false,
	barbar = false,
	bufferline = true,
	markdown = true,
	lightspeed = false,
	ts_rainbow = false,
	hop = false,
	notify = true,
	telekasten = true,
}
}
vim.cmd[[colorscheme catppuccin]]

-- extra stuff
vim.cmd('hi Normal guibg=#111217')

-- Gitsigns colors
vim.cmd('hi GitSignsAdd guifg=#a8f9c4')
vim.cmd('hi GitSignsChange guifg=#aeb1ff')
vim.cmd('hi GitSignsDelete guifg=#feb8bf')

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
-- vim.cmd('hi LineNr guibg=#1c1c26')
