vim.cmd [[
      let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
      ]]

vim.cmd("highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline")
vim.cmd("highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline")
