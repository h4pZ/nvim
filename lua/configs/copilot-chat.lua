local copilot_cfg = {
  window = {
    width = 0.35,
  },
  highlight_headers = false,
  separator = '---',
  error_header = '> [!ERROR] Error',
}

require("CopilotChat").setup(copilot_cfg)
