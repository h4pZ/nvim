require("symbols-outline").setup({
      position = "right",
      width = 15,
      show_numbers = false,
      show_relative_numbers = false,
      show_symbol_details = true,
      keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = { "<Esc>", "q" },
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
      },
      lsp_blacklist = {},
      symbol_blacklist = {}
})
