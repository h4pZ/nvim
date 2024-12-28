local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  win = {
    border = "rounded", -- none, single, double, shadow
  --   position = "bottom", -- bottom, top
    -- margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    -- padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    -- winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = {"<leader>"} -- or specify a list manually
}

-- For Transparency
local is_transparent = true -- Start with transparency by default

function toggle_transparency()
  require('base46').toggle_transparency()

  if not is_transparent then
    -- Enable transparency and adjust highlight groups
    vim.cmd("hi TabLine guibg=NONE")
    vim.cmd("hi TbBufOn guibg=#191724")
    vim.cmd("hi TbBufOnClose guibg=#191724")
    vim.cmd("hi TbBufOnModified guibg=#191724")
  end

  -- Toggle the state
  is_transparent = not is_transparent
end


require("which-key").add({
  { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer", mode = "n" },
  { "<leader>y", "<cmd>w!<CR>", desc = "Save", mode = "n" },
  { "<leader>q", "<cmd>q!<CR>", desc = "Quit", mode = "n" },
  { "<leader>C", "<cmd>close<CR>", desc = "Close Split", mode = "n" },
  { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight", mode = "n" },
  { "<leader>P", "<cmd>Telescope projects<cr>", desc = "Projects", mode = "n" },

  -- Telescope Find group
  { "<leader>f", group = "Telescope find" },
  { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Find files", mode = "n" },
  { "<leader>fF", "<cmd>Telescope live_grep theme=dropdown<cr>", desc = "Find Text", mode = "n" },
  { "<leader>ft", "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top theme=dropdown<CR>", desc = "Text Current Buffer", mode = "n" },
  { "<leader>fM", "<cmd>Telescope marks sorting_strategy=ascending prompt_position=top theme=dropdown<CR>", desc = "Telescope Marks", mode = "n" },
  { "<leader>fT", "<cmd>TodoTrouble<cr>", desc = "Todo Trouble", mode = "n" },
  { "<leader>fh", "<cmd>TodoTelescope<cr>", desc = "Todo Telescope", mode = "n" },
  { "<leader>fc", "<cmd>lua require('telescope.builtin').commands()<cr>", desc = "Commands Telescope", mode = "n" },
  { "<leader>fn", "<cmd>lua require('telescope').extensions.notify.notify()<cr>", desc = "Notifications Telescope", mode = "n" },

  -- Iron group
  { "<leader>i", group = "Iron" },
  { "<leader>if", "<cmd>IronFocus<cr>", desc = "Focus REPL", mode = "n" },
  { "<leader>ih", "<cmd>IronHide<cr>", desc = "Hide REPL", mode = "n" },
  { "<leader>is", "<cmd>lua require('iron.core').close_repl()<cr>", desc = "Stop REPL", mode = "n" },
  { "<leader>iF", "<cmd>lua require('iron.core').send_file()<cr>", desc = "Send File", mode = "n" },
  { "<leader>il", "<cmd>lua require('iron.core').send_line()<cr>", desc = "Send Line", mode = "n" },

  -- DAP group
  { "<leader>d", group = "DAP" },
  { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint", mode = "n" },
  { "<leader>dy", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", desc = "Conditional Breakpoint", mode = "n" },
  { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue", mode = "n" },
  { "<leader>de", "<cmd>lua require'dapui'.eval()<cr>", desc = "Eval", mode = "n" },
  { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over", mode = "n" },
  { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into", mode = "n" },
  { "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back", mode = "n" },
  { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle REPL", mode = "n" },
  { "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run To Cursor", mode = "n" },
  { "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect", mode = "n" },
  { "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session", mode = "n" },
  { "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out", mode = "n" },
  { "<leader>dl", "<cmd>lua require'dap'.clear_breakpoints()<cr>", desc = "Clear Breakpoints", mode = "n" },
  { "<leader>dp", "<cmd>lua require'dap'.pause.toggle()<cr>", desc = "Pause", mode = "n" },
  { "<leader>dq", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle DAP UI", mode = "n" },
  { "<leader>dT", "<cmd>lua require'dap'.terminate()<cr>", desc = "Terminate Session", mode = "n" },
  { "<leader>dm", "<cmd>lua require'dap-python'.test_method()<cr>", desc = "Test Method", mode = "n" },
  { "<leader>da", "<cmd>lua require'dap-python'.test_class()<cr>", desc = "Test Class", mode = "n" },
  { "<leader>ds", "<cmd>lua require'dap-python'.debug_selection()<cr>", desc = "Debug Selection", mode = "n" },

  -- Neogen group
  { "<leader>n", group = "Neogen" },
  { "<leader>nn", "<cmd>lua require'neogen'.generate({ annotation_convention = { python = 'numpydoc' }})<cr>", desc = "Numpy docstring", mode = "n" },
  { "<leader>ng", "<cmd>lua require'neogen'.generate({ annotation_convention = { python = 'google_docstrings' }})<cr>", desc = "Google docstring", mode = "n" },
  { "<leader>nr", "<cmd>lua require'neogen'.generate({ annotation_convention = { python = 'reST' }})<cr>", desc = "reST docstring", mode = "n" },

  -- Markdown group
  { "<leader>m", group = "Markdown" },
  { "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "Markdown Preview", mode = "n" },
  { "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", desc = "Markdown Preview Stop", mode = "n" },
  { "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview Toggle", mode = "n" },

  -- Git group
  { "<leader>g", group = "Git" },
  { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit", mode = "n" },
  { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk", mode = "n" },
  { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk", mode = "n" },
  { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame", mode = "n" },
  { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk", mode = "n" },
  { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk", mode = "n" },
  { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer", mode = "n" },
  { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk", mode = "n" },
  { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk", mode = "n" },
  { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file", mode = "n" },
  { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", mode = "n" },
  { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit", mode = "n" },
  { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff", mode = "n" },
  { "<leader>gD", "<cmd>wincmd p | q<cr>", desc = "Close Diff", mode = "n" },

  -- LSP group
  { "<leader>l", group = "LSP" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", mode = "n" },
  { "<leader>ld", "<cmd>TroubleToggle<cr>", desc = "Diagnostics", mode = "n" },
  { "<leader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>", desc = "Workspace Diagnostics", mode = "n" },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format", mode = "n" },
  { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info", mode = "n" },
  { "<leader>lI", "<cmd>Mason<cr>", desc = "Installer Info", mode = "n" },
  { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostic", mode = "n" },
  { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic", mode = "n" },
  { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action", mode = "n" },
  { "<leader>lo", "<cmd>SymbolsOutline<cr>", desc = "Outline", mode = "n" },
  { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc = "Quickfix", mode = "n" },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", mode = "n" },
  { "<leader>lR", "<cmd>TroubleToggle lsp_references<cr>", desc = "References", mode = "n" },
  { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", mode = "n" },
  { "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Type Definition", mode = "n" },
  { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols", mode = "n" },

  -- Search group
  { "<leader>s", group = "Search" },
  { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", mode = "n" },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help", mode = "n" },
  { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", mode = "n" },
  { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", mode = "n" },
  { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers", mode = "n" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", mode = "n" },
  { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands", mode = "n" },
  { "<leader>st", "<cmd>Telescope themes<cr>", desc = "Themes", mode = "n" },

  -- Hop group
  { "<leader>H", group = "Hop" },
  { "<leader>Hh", "<cmd>HopChar2<cr>", desc = "Hop 2 characters", mode = "n" },
  { "<leader>Hp", "<cmd>HopPattern<cr>", desc = "Hop to pattern", mode = "n" },
  { "<leader>HH", "<cmd>HopWord<cr>", desc = "Hop to word", mode = "n" },

  -- Terminal group
  { "<leader>t", group = "Terminal" },
  { "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Node", mode = "n" },
  { "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>", desc = "NCDU", mode = "n" },
  { "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>", desc = "Htop", mode = "n" },
  { "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Python", mode = "n" },
  { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float", mode = "n" },
  { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal", mode = "n" },
  { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical", mode = "n" },

  -- Tabs group
  { "<leader>T", group = "Tabs" },
  { "<leader>Tn", "<cmd>tabnew<cr>", desc = "New Tab", mode = "n" },
  { "<leader>Tc", "<cmd>tabclose<cr>", desc = "Close Current Tab", mode = "n" },
  { "<leader>Tt", "<cmd>lua toggle_transparency()<cr>", desc = "Toggle Transparency", mode = "n" },

  -- Copilot group
  { "<leader>G", group = "Copilot" },
  { "<leader>Gt", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<cr>", desc = "Toggle auto trigger", mode = "n" },
  { "<leader>Gv", "<cmd>lua require('copilot.suggestion').is_visible()<cr>", desc = "Is visible?", mode = "n" },
  { "<leader>Ga", "<cmd>lua require('copilot.suggestion').accept()<cr>", desc = "Accept", mode = "n" },
  { "<leader>Gw", "<cmd>lua require('copilot.suggestion').accept_word()<cr>", desc = "Accept word", mode = "n" },
  { "<leader>Gl", "<cmd>lua require('copilot.suggestion').accept_line()<cr>", desc = "Accept line", mode = "n" },
  { "<leader>Gn", "<cmd>lua require('copilot.suggestion').next()<cr>", desc = "Next suggestion", mode = "n" },
  { "<leader>Gp", "<cmd>lua require('copilot.suggestion').prev()<cr>", desc = "Previous suggestion", mode = "n" },
  { "<leader>Gd", "<cmd>lua require('copilot.suggestion').dismiss()<cr>", desc = "Dismiss suggestion", mode = "n" },
})


which_key.setup(setup)
-- which_key.register(mappings, opts)
