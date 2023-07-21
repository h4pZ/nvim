local custom_ayu_mirage = require("lualine.themes.ayu_mirage")

custom_ayu_mirage.normal.a.bg = "#ABE9B3"
custom_ayu_mirage.insert.a.bg = "#aeb1ff"
custom_ayu_mirage.visual.a.bg = "#96cdfb"
custom_ayu_mirage.replace.a.bg = "#f70067"
custom_ayu_mirage.normal.c.bg = "#1e1e28"
custom_ayu_mirage.normal.b.bg = "#1e1e28"
custom_ayu_mirage.insert.b.bg = "#1e1e28"
custom_ayu_mirage.visual.b.bg = "#1e1e28"
custom_ayu_mirage.replace.b.bg = "#1e1e28"

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

copilot_status = require('user.copilot_status').get_status

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = false,
    update_in_insert = false,
    always_visible = true,
}

local diff = {
    "diff",
    colored = true,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width,
}

local mode = {
    "mode",
    fmt = function(str)
    return "-- " .. str .. " --"
    end,
}

local filetype = {
    "filetype",
    icon = nil,
    icons_enabled = true,
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
}

local location = {
    "location",
    padding = 1,
}

function env_cleanup(venv)
  if string.find(venv, "/") then
    local final_venv = venv
    for w in venv:gmatch "([^/]+)" do
      final_venv = w
    end
    venv = final_venv
  end
  return venv
end

local python_env = {
  function()
    if vim.bo.filetype == "python" then
      local venv = os.getenv "CONDA_DEFAULT_ENV" or os.getenv "VIRTUAL_ENV"
      if venv then
        local icons = require "nvim-web-devicons"
        local py_icon, _ = icons.get_icon ".py"
        return string.format(" " .. py_icon .. " (%s)", env_cleanup(venv))
      end
    end
    return ""
  end,
  color = { fg = "#c9cbff" },
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end


local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end


local function show_macro_recording()
    local recording_register = vim.fn.reg_recording()
    if recording_register == "" then
        return ""
    else
        return "Recording @" .. recording_register
    end
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = custom_ayu_mirage,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { branch, diagnostics },
        lualine_b = { python_env, copilot_status },
        lualine_c = { {"macro-recording", fmt = show_macro_recording}, },
        -- lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_x = { diff, spaces, "encoding", filetype },
        lualine_y = { location },
        lualine_z = { 'progress' },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename", "searchcount" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})
