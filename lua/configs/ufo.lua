local ufo = require('ufo')

-- Using treesitter as the main provider
ufo.setup({
  provider_selector = function(bufnr, filetype, buftype)
    return {'treesitter', 'indent'}
  end,
  preview = {
    win_config = {
      border = 'rounded',
      winhighlight = 'Normal:UfoPreviewNormal,FloatBorder:UfoPreviewBorder',
      winblend = 0
    }
  },
  -- Show fold column
  fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (' 󰁂 %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
      local chunkText = chunk[1]
      local chunkWidth = vim.fn.strdisplaywidth(chunkText)
      if targetWidth > curWidth + chunkWidth then
        table.insert(newVirtText, chunk)
      else
        chunkText = truncate(chunkText, targetWidth - curWidth)
        local hlGroup = chunk[2]
        table.insert(newVirtText, {chunkText, hlGroup})
        chunkWidth = vim.fn.strdisplaywidth(chunkText)
        -- str width returned from truncate() may less than 2nd argument, need padding
        if curWidth + chunkWidth < targetWidth then
          suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
        end
        break
      end
      curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
  end
})

-- Keymaps for ufo
vim.keymap.set('n', 'zR', ufo.openAllFolds, { desc = 'Open all folds' })
vim.keymap.set('n', 'zM', ufo.closeAllFolds, { desc = 'Close all folds' })
vim.keymap.set('n', 'zr', ufo.openFoldsExceptKinds, { desc = 'Open folds except kinds' })
vim.keymap.set('n', 'zm', ufo.closeFoldsWith, { desc = 'Close folds with' })
-- Peek fold without opening it
vim.keymap.set('n', 'K', function()
  local winid = ufo.peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, { desc = 'Peek fold or LSP hover' })
