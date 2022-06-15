local theme = {
   black = "#1E1D2D",
   darker_black = "#191828",
   red = "#F28FAD",
   green = "#ABE9B3",
}

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
      bg = theme.black,
   },

   DiffNewFile = {
      fg = "NONE",
      bg = git_colors.dark_green,
   },

   DiffLine = {
      fg = "NONE",
      bg = theme.black,
   },

   DiffRemoved = {
      fg = "NONE",
      bg = git_colors.dark_red,
   },

   -- gitsigns
   GitSignsAdd = {
      fg = theme.green,
      bg = "NONE",
   },

   GitSignsChange = {
      fg = theme.green,
      bg = "NONE",
   },

   GitSignsDelete = {
      fg = theme.red,
      bg = "NONE",
   },
}

M.add = {
   -- Octo
   OctoEditable = { bg = theme.darker_black },
   OctoGreenFloat = { bg = theme.darker_black },
   OctoRedFloat = { bg = theme.darker_black },
   OctoPurpleFloat = { bg = theme.darker_black },
   OctoYellowFloat = { bg = theme.darker_black },
   OctoBlueFloat = { bg = theme.darker_black },
   OctoGreyFloat = { bg = theme.darker_black },

   ExtraWhitespace = { bg = theme.red },
}

return M
