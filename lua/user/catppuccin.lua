local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup{
    compile = {
      enabled = true,
      path = vim.fn.stdpath "cache" .. "/catppuccin",
      suffix = "_compiled"
    },
    transparent_background = true,
    term_colors = true,
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
              errors = {},
              hints = {},
              warnings = {},
              information = {},
            },
            underlines = {
              errors = {"underline"},
              hints = {"underline"},
              warnings = {"underline"},
              information = {"underline"},
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
            show_root = true,
            transparent_panel = true,
        },
        neotree = {
            enabled = false,
            show_root = false,
            transparent_panel = false,
        },
        which_key = true,
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
    },
}

vim.cmd.colorscheme "catppuccin-mocha"

-- extra stuff
vim.cmd('hi Normal guibg=#11111b')

-- Gitsigns colors
vim.cmd('hi GitSignsAdd guifg=#a8f9c4')
vim.cmd('hi GitSignsChange guifg=#aeb1ff')
vim.cmd('hi GitSignsDelete guifg=#feb8bf')

-- Signs handlers.lua file
vim.cmd('hi DiagnosticSignError guifg=#F28FAD')
vim.cmd('hi DiagnosticVirtualTextError guifg=#F28FAD')
vim.cmd('hi DiagnosticFloatingError guifg=#F28FAD')
vim.cmd('hi DiagnosticSignWarn  guifg=#FAE3B0')
vim.cmd('hi DiagnosticFloatingWarn  guifg=#FAE3B0')
vim.cmd('hi DiagnosticSignHint  guifg=#a8f9c4')
vim.cmd('hi DiagnosticFloatingHint  guifg=#a8f9c4')
vim.cmd('hi DiagnosticSignInfo  guifg=#8cd7ff')
vim.cmd('hi DiagnosticFloatingInfo  guifg=#8cd7ff')
vim.cmd('hi DiagnosticUnderlineError guisp=#F28FAD')

-- For the floating window background
vim.cmd('hi NormalFloat guibg=#11111b')

-- For dap
vim.cmd('hi DapBreakpoint guifg=#f70067')
vim.cmd('hi DapBreakpointCondition guifg=#f70067')

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
vim.cmd('hi FocusedSymbol guibg=#1a1c24 guifg=#f70067')

-- For the number color.
vim.cmd('hi CursorLineNr guifg=#a8f9c4')
-- vim.cmd('hi LineNr guibg=#1c1c26')
-- vim.cmd('hi SignColumn guibg=#1c1c26')

-- For bufferline.
vim.cmd('hi BufferLineTabSelected guifg=#CDD6F4 guibg=#1E1E2E')
vim.cmd('hi BufferLineTab guifg=#45475a guibg=#181825')

-- For the things that divide splits.
vim.cmd('hi WinSeparator guibg=None guifg=#434369')

-- For which key background.
vim.cmd('hi WhichKeyFloat guibg=#11111b')
vim.cmd('hi FloatBorder guifg=#3d4154')
vim.cmd('hi WhichKeyBorder guifg=#3d4154')
vim.cmd('hi TelescopeBorder guifg=#3d4154')

-- NvimTree
vim.cmd('hi NvimTreeFolderIcon guifg=#FAE3B0')

-- fidget
vim.cmd('hi FidgetTitle guifg=#c9cbff')
vim.cmd('hi FidgetTask guifg=#3d4154')
