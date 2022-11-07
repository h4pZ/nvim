function os.capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

--[[ local python_path = os.capture("which python", false) ]]
local python_path = vim.fn.stdpath("data")..'/mason/packages/debugpy/venv/bin/python3'
require('dap-python').setup(python_path)
require('dap-python').test_runner = 'pytest'
