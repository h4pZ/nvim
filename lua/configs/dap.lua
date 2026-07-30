local dap = require('dap')
vim.fn.sign_define('DapBreakpoint', {text='●', texthl='DapBreakpoint', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='⋉', texthl='DapBreakpoint', linehl='', numhl=''})

-- C/C++ via codelldb (installed by Mason)
dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
    args = { '--port', '${port}' },
  },
}

dap.configurations.cpp = {
  {
    name = 'Launch binary',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

-- C reuses the same setup
dap.configurations.c = dap.configurations.cpp

--[[ dap.listeners.before.event_terminated["dapui_config"] = function() ]]
--[[   dapui.close() ]]
--[[ end ]]
--[[ dap.listeners.before.event_exited["dapui_config"] = function() ]]
--[[   dapui.close() ]]
--[[ end ]]
