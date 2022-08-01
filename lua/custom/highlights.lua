local git_colors = {
  red = "#794756",
  dark_red = "#482a33",
  green = "#557459",
  dark_green = "#334535",
}

local M = {}

M.override = {
  -- Gitsigns.nvim
  DiffAdd = {
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
    bg = git_colors.dark_green,
  },

  DiffDelete = {
    fg = "NONE",
    bg = git_colors.dark_red,
  },

  DiffText = {
    fg = "NONE",
    bg = git_colors.green,
  },

  DiffAdded = {
    fg = "NONE",
    bg = git_colors.dark_green,
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

  DiffRemoved = {
    fg = "NONE",
    bg = git_colors.dark_red,
  },
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

  -- Octo
  OctoEditable = { bg = "darker_black" },
  OctoDirty = { bg = "red" },

  ExtraWhitespace = { bg = "red" },
  ErrorMsg = { fg = "darker_black", bg = "red" },
}

return M
