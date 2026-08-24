-- Rose Pine Main — https://rosepinetheme.com/palette
local M = {}

M.base_30 = {
  white         = "#e0def4", -- text
  darker_black  = "#13111e",
  black         = "#191724", -- base
  black2        = "#1f1d2e", -- surface
  one_bg        = "#26233a", -- overlay
  one_bg2       = "#2d2a3d",
  one_bg3       = "#33303f",
  grey          = "#403d52", -- highlight_med
  grey_fg       = "#4a4760",
  grey_fg2      = "#524f67", -- highlight_high
  light_grey    = "#6e6a86", -- muted
  red           = "#eb6f92", -- love
  baby_pink     = "#f083a0",
  pink          = "#ebbcba", -- rose
  line          = "#2a2737",
  green         = "#9ccfd8", -- foam
  vibrant_green = "#a8dde6",
  nord_blue     = "#7fbfca",
  blue          = "#31748f", -- pine
  yellow        = "#f6c177", -- gold
  sun           = "#fbd099",
  purple        = "#c4a7e7", -- iris
  dark_purple   = "#b898de",
  teal          = "#31748f", -- pine
  orange        = "#f6c177", -- gold (no distinct orange in palette)
  cyan          = "#9ccfd8", -- foam
  statusline_bg = "#201e2b",
  lightbg       = "#2d2b38",
  pmenu_bg      = "#c4a7e7", -- iris
  folder_bg     = "#31748f", -- pine
  lavender      = "#c4a7e7", -- iris
}

M.base_16 = {
  base00 = "#191724", -- base (background)
  base01 = "#1f1d2e", -- surface
  base02 = "#26233a", -- overlay
  base03 = "#6e6a86", -- muted (comments)
  base04 = "#908caa", -- subtle
  base05 = "#e0def4", -- text (foreground)
  base06 = "#e0def4",
  base07 = "#524f67", -- highlight_high
  base08 = "#eb6f92", -- love (variables, errors)
  base09 = "#f6c177", -- gold (integers, constants)
  base0A = "#ebbcba", -- rose (classes)
  base0B = "#9ccfd8", -- foam (strings)
  base0C = "#9ccfd8", -- foam (regex, escape)
  base0D = "#c4a7e7", -- iris (functions)
  base0E = "#31748f", -- pine (keywords)
  base0F = "#ebbcba", -- rose (deprecated)
}

M.type = "dark"

return M
