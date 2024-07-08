-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  hl_override = {
    NvDashAscii = { fg = "#f70067", bg = "black" },

    WhichKey = { fg = "orange" },
    WhichKeyDesc = { fg = "white" },
    WhichKeyGroup = { fg = "pink" },
    WhichKeyValue = { fg = "pink" },

    TelescopePromptPrefix = { fg = "purple" },
    TelescopePromptTitle = { bg = "purple" },
    TelescopeResultsTitle = { fg = "white" },

    TbLineBufOffModified = { fg = "orange" },
    TbLineBufOnClose = { fg = "white" },
    TbLineCloseAllBufsBtn = { fg = "orange" },

    St_LspStatus = { fg = "white", bg = "base00" },
    St_cwd_icon = { bg = "purple" },
    St_cwd_sep = { fg = "purple" },
    St_NormalMode = { bg = "vibrant_green" },
    St_NormalModeSep = { fg = "vibrant_green" },
    St_InsertMode = { bg = "cyan" },
    St_InsertModeSep = { fg = "cyan" },
    St_VisualMode = { bg = "lavender" },
    St_VisualModeSep = { fg = "lavender" },
    St_ReplaceMode = { bg = "#f70067" },
    St_ReplaceModeSep = { fg = "#f70067" },

    NvimTreeEmptyFolderName = { fg = "sun" },
    NvimTreeFolderIcon = { fg = "sun" },
    NvimTreeFolderName = { fg = "sun" },
    NvimTreeFolderArrowOpen = { fg = "sun" },
    NvimTreeOpenedFolderName = { fg = "orange" },
    NvimTreeRootFolder = { fg = "pink", },
    NvimTreeGitDeleted = { fg = "pink", },

    MasonHeader = { bg = "orange" },
  },
  nvdash = {
    load_on_startup = true,
    header = {
      "            ⠀⠀⣀⣤⡤⠀⠀⠀⠀⠀⠀    ⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "       ⠀⠀⠀⢀⣾⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "       ⠀⠀⣠⣾⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "      ⠀⠀⢸⠛⠉⢹⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠄⠠⣀⠀⠀⠀⠀⠀⠀⠀⠀",
      "      ⠀⠀⡘⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠖⠉⠀⠀⠀⣾⣿⣦⡀⠀⠀⠀⠀⠀",
      "      ⠀⠀⡇⠀⠀⠀⢡⠄⠀⠀⣀⣀⣀⣠⠊⠀⠀⠀⠀⡠⠞⠛⠛⠛⠛⠀⠀⠀⠀⠀",
      "      ⠀⠀⢃⠀⠀⠀⠀⠗⠚⠉⠉⠀⠈⠁⠀⠀⠀⢀⡔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "      ⠀⠀⠸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣶⣄⠲⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "      ⠀⠀⠀⠃⠀⠀⢠⣤⡀⠀⠀⠀⠀⣿⣿⣿⠀⠘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "      ⠀⠀⠀⡆⠀⠀⣿⣿⡇⠀⠀⠀⠀⠈⠛⠉⣴⣆⢹⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "      ⠀⠀⠀⣇⢰⡧⣉⡉⠀⠀⢀⡀⠀⣀⣀⣠⣿⡷⢠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "      ⠀⠀⠀⢻⠘⠃⠈⠻⢦⠞⠋⠙⠺⠋⠉⠉⠉⢡⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "      ⠀⠀⠀⠀⠳⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠀",
      "      ⠀⠀⠀⠀⠀⠀⠈⠁⢲⡄⠀⠀⠀⠀⠀⠀⠘⡆⠀⠀⠀⣀⣤⣴⣶⣿⣿⣿⣿⡇",
      "        ⠀⠀⠀⠀⠀⡰⠋⠀⠀⠀⠀⠀⠀⠀⠀⢿⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃",
      "       ⠀⠀⠀⠀⢀⡞⠁⠀⠀⣾⠀⠀⣶⠀⠀⠀⢸⣦⣴⣿⣿⣿⠛⠉⠉⠉⠉⠁⠀",
      "      ⠀⠀⢀⣀⡰⠏⠀⠀⠀⠀⠉⠀⠈⠋⠀⠀⠀⠘⣿⣿⣿⠛⠋⠀⠀⠀⠀⠀⠀⠀",
      "      ⠰⣮⣉⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⡋⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "      ⠀⠈⠉⠻⠥⠤⢤⣶⢄⠀⢀⣠⣄⠀⠀⢠⣶⣤⣄⠈⠑⡄⠀⠀⠀⠀⠀⠀⠀⠀",
      "      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠈⠋⠁⠠⠁⠀⠈⠁⠀⠀⠀⠀⠀⠀     ",
      "                                    ",
      "            『ミミッキュ』          ",
    },
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
  theme = "real-cat",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

return M
