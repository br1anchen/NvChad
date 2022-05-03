local colors = require("base16").get_colors "base_30"

local git_colors = {
   red = "#794756",
   dark_red = "#482a33",
   green = "#557459",
   dark_green = "#334535",
}

return {
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
      bg = colors.black,
   },

   DiffNewFile = {
      fg = "NONE",
      bg = git_colors.dark_green,
   },

   DiffLine = {
      fg = "NONE",
      bg = colors.black,
   },

   DiffRemoved = {
      fg = "NONE",
      bg = git_colors.dark_red,
   },

   -- gitsigns
   GitSignsAdd = {
      fg = colors.green,
      bg = "NONE",
   },

   GitSignsChange = {
      fg = colors.green,
      bg = "NONE",
   },

   GitSignsDelete = {
      fg = colors.red,
      bg = "NONE",
   },

   -- Octo
   OctoEditable = { bg = colors.darker_black },
   OctoGreenFloat = { bg = colors.darker_black },
   OctoRedFloat = { bg = colors.darker_black },
   OctoPurpleFloat = { bg = colors.darker_black },
   OctoYellowFloat = { bg = colors.darker_black },
   OctoBlueFloat = { bg = colors.darker_black },
   OctoGreyFloat = { bg = colors.darker_black },
}
