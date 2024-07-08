require('dap')
vim.fn.sign_define('DapBreakpoint', {text='●', texthl='DapBreakpoint', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='⋉', texthl='DapBreakpoint', linehl='', numhl=''})

--[[ dap.listeners.before.event_terminated["dapui_config"] = function() ]]
--[[   dapui.close() ]]
--[[ end ]]
--[[ dap.listeners.before.event_exited["dapui_config"] = function() ]]
--[[   dapui.close() ]]
--[[ end ]]
