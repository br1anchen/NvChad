local git_colors = {
  red = "#794756",
  dark_red = "#482a33",
  green = "#557459",
  dark_green = "#334535",
  dark_blue = "#3d5c7b",
  orange = "#87663b",
}

local M = {}

M.override = {
  -- Gitsigns.nvim
  DiffAdd = {
    fg = "NONE",
    bg = git_colors.dark_green,
  },

  DiffAdded = {
    fg = "NONE",
    bg = git_colors.dark_green,
  },

  DiffChange = {
    fg = "NONE",
    bg = git_colors.dark_green,
  },

  DiffChangeDelete = {
    fg = "NONE",
    bg = git_colors.dark_red,
  },

  DiffModified = {
    fg = "NONE",
    bg = git_colors.dark_blue,
  },

  DiffDelete = {
    fg = "NONE",
    bg = git_colors.dark_red,
  },

  DiffRemoved = {
    fg = "NONE",
    bg = git_colors.dark_red,
  },

  ErrorMsg = { fg = "darker_black", bg = "red" },
}

M.add = {
  -- gitsigns
  GitSignsAdd = {
    fg = "green",
    bg = "NONE",
  },

  GitSignsChange = {
    fg = "green",
    bg = "NONE",
  },

  GitSignsDelete = {
    fg = "red",
    bg = "NONE",
  },

  -- git diff preview
  DiffText = {
    fg = "NONE",
    bg = git_colors.orange,
  },

  DiffFile = {
    fg = "NONE",
    bg = "black",
  },

  DiffNewFile = {
    fg = "NONE",
    bg = git_colors.dark_green,
  },

  DiffLine = {
    fg = "NONE",
    bg = "black",
  },

  -- Octo
  OctoEditable = { bg = "darker_black" },
  OctoDirty = { bg = git_colors.dark_red },

  ExtraWhitespace = { bg = "red" },

  LeapBackdrop = { fg = "grey" },

  CmpItemKindCopilot = { fg = "green" },
}

return M
