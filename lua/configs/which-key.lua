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

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["y"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["C"] = { "<cmd>close<CR>", "Close Split" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["P"] = { "<cmd>Telescope projects<cr>", "Projects" },

  f = {
    name = "Telescope find",
    f = {" <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Find files"},
    F = { "<cmd>Telescope live_grep theme=dropdown<cr>", "Find Text" },
    t = { "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top theme=dropdown<CR>", "Text Current Buffer"},
    M = { "<cmd>Telescope marks sorting_strategy=ascending prompt_position=top theme=dropdown<CR>", "Telescope Marks"},
    T = { "<cmd>TodoTrouble<cr>", "Todo Trouble" },
    h = { "<cmd>TodoTelescope<cr>", "Todo Telescope" },
    c = { "<cmd>lua require('telescope.builtin').commands()<cr>", "Commands Telescope" },
    n = { "<cmd>lua require('telescope').extensions.notify.notify()<cr>", "Notifications Telescope" },
  },

  i = {
    name = "Iron",
    f = {" <cmd>IronFocus<cr>", "Focus REPL"},
    h = {" <cmd>IronHide<cr>", "Hide REPL"},
    s = {" <cmd>lua require('iron.core').close_repl()<cr>", "Stop REPL"},
    F = {" <cmd>lua require('iron.core').send_file()<cr>", "Send File"},
    l = {" <cmd>lua require('iron.core').send_line()<cr>", "Send Line"},
  },

  d = {
    name = "DAP",
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    y = {"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Conditional Breakpoint"},
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue"},
    e = { "<cmd>lua require'dapui'.eval()<cr>", "Eval"},
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over"},
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into"},
    b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle repl"},
    C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    l = { "<cmd>lua require'dap'.clear_breakpoints()<cr>", "Clear Breakpoinst"},
    p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
    q = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle dap-ui" },
    T = { "<cmd>lua require'dap'.terminate()<cr>", "Terminates Session" },
    m = { "<cmd>lua require'dap-python'.test_method()<cr>", "Test Method" },
    a = { "<cmd>lua require'dap-python'.test_class()<cr>", "Test Class" },
    s = { "<cmd>lua require'dap-python'.debug_selection()<cr>", "Debug Selection" },
  },

  n = {
    name = "Neogen",
    n = { "<cmd>lua require'neogen'.generate({ annotation_convention = { python = 'numpydoc' }})<cr>", "Numpy docstring"},
    g = { "<cmd>lua require'neogen'.generate({ annotation_convention = { python = 'google_docstrings' }})<cr>", "Google docstring"},
    r = { "<cmd>lua require'neogen'.generate({ annotation_convention = { python = 'reST' }})<cr>", "reST docstring"},
  },

  m = {
    name = "Markdown",
    p = { "<cmd>MarkdownPreview<cr>", "Markdown Preview"},
    s = { "<cmd>MarkdownPreviewStop<cr>", "Markdown Preview Stop"},
    t = { "<cmd>MarkdownPreviewToggle<cr>", "Markdown Preview Toggle"},
  },

  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
    D = { "<cmd>wincmd p | q<cr>", "Close Diff" },
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>TroubleToggle<cr>", "Diagnostics" },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    o = { "<cmd>SymbolsOutline<cr>", "Outline" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    t = {"<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition"},
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    t = { "<cmd>Telescope themes<cr>", "Commands" },
    },

  H = {
    name = "Hop",
    h = { "<cmd>HopChar2<cr>", "Hop 2 characters" },
    p = { "<cmd>HopPattern<cr>", "Hop to pattern" },
    H = { "<cmd>HopWord<cr>", "Hop to word" },
  },

  t = {
    name = "Terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },

  T = {
    name = "Tabs",
    n = {"<cmd>tabnew<cr>", "New Tab"},
    c = {"<cmd>tabclose<cr>", "Close Current Tab"}
    },

  G = {
    name = "Copilot",
    t = { "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<cr>", "Toggle auto trigger"},
    v = { "<cmd>lua require('copilot.suggestion').is_visible()<cr>", "Is visible?"},
    a = { "<cmd>lua require('copilot.suggestion').accept()<cr>", "Accept"},
    w = { "<cmd>lua require('copilot.suggestion').accept_word()<cr>", "Accept word"},
    l = { "<cmd>lua require('copilot.suggestion').accept_line()<cr>", "Accept line"},
    n = { "<cmd>lua require('copilot.suggestion').next()<cr>", "Next suggestion"},
    p = { "<cmd>lua require('copilot.suggestion').prev()<cr>", "Previous suggestion"},
    d = { "<cmd>lua require('copilot.suggestion').dismiss()<cr>", "Dismiss suggestion"},
  },
}

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

  -- Additional groups and bindings would follow here in a similar pattern
})


which_key.setup(setup)
-- which_key.register(mappings, opts)
