local M = {}

-- Store the copilot enabled state globally
M.copilot_enabled = false

-- Function to enable copilot
function M.enable_copilot()
  if M.copilot_enabled then
    vim.notify("Copilot is already enabled", vim.log.levels.INFO)
    return
  end

  -- Load the copilot module if not already loaded
  local ok, copilot = pcall(require, "copilot")
  if not ok then
    vim.notify("Failed to load Copilot module", vim.log.levels.ERROR)
    return
  end

  -- Load copilot-cmp to enable completion menu integration
  pcall(require, "copilot_cmp")

  -- Attach copilot to all buffers
  vim.cmd("Copilot attach")

  M.copilot_enabled = true
  vim.notify("Copilot enabled", vim.log.levels.INFO)
end

-- Function to disable copilot
function M.disable_copilot()
  if not M.copilot_enabled then
    vim.notify("Copilot is already disabled", vim.log.levels.INFO)
    return
  end

  -- Detach copilot from all buffers
  vim.cmd("Copilot detach")

  M.copilot_enabled = false
  vim.notify("Copilot disabled", vim.log.levels.INFO)
end

-- Main toggle function
function M.toggle()
  if M.copilot_enabled then
    M.disable_copilot()
  else
    M.enable_copilot()
  end
end

return M
