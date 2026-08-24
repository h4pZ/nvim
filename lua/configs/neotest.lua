local neotest = require "neotest"

neotest.setup {
  adapters = {
    -- Python: uses pytest. Falls back to unittest if no pytest in the venv.
    -- justMyCode=false lets the debugger step into library code too.
    require "neotest-python" {
      dap = { justMyCode = false },
      runner = "pytest",
    },

    -- Go: drives `go test`. Debugging goes through delve.
    require "neotest-golang" {
      go_test_args = { "-v", "-race", "-count=1" },
      dap_go_enabled = true,
    },

    -- C++: GoogleTest. Expects the test binaries to already be built,
    -- and looks for them under the configured build dir.
    require("neotest-gtest").setup {
      debug_adapter = "codelldb",
    },
  },

  discovery = {
    -- Only scan files that are actually open. Full-project discovery is
    -- slow on large C++ trees.
    enabled = false,
    concurrent = 1,
  },

  running = {
    concurrent = true,
  },

  summary = {
    animated = true,
    open = "botright vsplit | vertical resize 50",
  },

  output = {
    open_on_run = false,
  },

  output_panel = {
    enabled = true,
    open = "botright split | resize 15",
  },

  quickfix = {
    -- Don't hijack the quickfix list on every run; the summary panel is
    -- the primary UI here.
    enabled = false,
    open = false,
  },
}
