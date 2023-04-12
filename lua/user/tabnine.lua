require('tabnine').setup({
  disable_auto_comment=false,
  accept_keymap="<C-]>",
  dismiss_keymap = "<C-[>",
  debounce_ms = 300,
  suggestion_color = {gui = "#FAE3B0"},
  execlude_filetypes = {"TelescopePrompt"}
})
