local cmd = vim.cmd

local colors = require("colors").get()
local ui = require("core.utils").load_config().ui

local black = colors.black
local black2 = colors.black2
local blue = colors.blue
local darker_black = colors.darker_black
local folder_bg = colors.folder_bg
local green = colors.green
local grey = colors.grey
local grey_fg = colors.grey_fg
local light_grey = colors.light_grey
local line = colors.line
local nord_blue = colors.nord_blue
local one_bg = colors.one_bg
local one_bg2 = colors.one_bg2
local pmenu_bg = colors.pmenu_bg
local purple = colors.purple
local red = colors.red
local white = colors.white
local yellow = colors.yellow
local orange = colors.orange

local git_colors = {
   red = "#794756",
   dark_red = "#482a33",
   green = "#557459",
   dark_green = "#334535",
}

-- Disable cursor line
cmd "hi clear CursorLine"

-- highlight groups & colors
local hl_cols = {

   Comment = { fg = grey_fg },

   -- line numbers
   CursorLineNr = { fg = white },
   LineNr = { fg = grey },

   -- those ugly ~'s
   EndOfBuffer = { fg = black },

   -- floating windows
   FloatBorder = { fg = blue },
   NormalFloat = { bg = darker_black },

   -- Pmenu i.e completion menu
   Pmenu = { bg = one_bg },
   PmenuSbar = { bg = one_bg2 },
   PmenuSel = { bg = pmenu_bg, fg = black },
   PmenuThumb = { bg = nord_blue },

   -- nvim cmp
   CmpItemAbbr = { fg = white },
   CmpItemAbbrMatch = { fg = white },
   CmpItemKind = { fg = white },
   CmpItemMenu = { fg = white },

   NvimInternalError = { fg = red },
   WinSeparator = { fg = one_bg2 },

   -- Dashboard i.e alpha.nvim
   AlphaHeader = { fg = grey_fg },
   AlphaButtons = { fg = light_grey },

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
      bg = black,
   },

   DiffNewFile = {
      fg = "NONE",
      bg = git_colors.dark_green,
   },

   DiffLine = {
      fg = "NONE",
      bg = black,
   },

   DiffRemoved = {
      fg = "NONE",
      bg = git_colors.dark_red,
   },

   -- gitsigns
   GitSignsAdd = {
      fg = green,
      bg = "NONE",
   },

   GitSignsChange = {
      fg = green,
      bg = "NONE",
   },

   GitSignsDelete = {
      fg = red,
      bg = "NONE",
   },

   -- Indent blankline
   IndentBlanklineChar = { fg = line },
   IndentBlanklineSpaceChar = { fg = line },

   -- Lsp Diagnostics
   DiagnosticHint = { fg = purple },
   DiagnosticError = { fg = red },
   DiagnosticWarn = { fg = yellow },
   DiagnosticInformation = { fg = green },

   -- NvimTree
   NvimTreeEmptyFolderName = { fg = folder_bg },
   NvimTreeEndOfBuffer = { fg = darker_black },
   NvimTreeFolderIcon = { fg = folder_bg },
   NvimTreeFolderName = { fg = folder_bg },
   NvimTreeGitDirty = { fg = red },
   NvimTreeIndentMarker = { fg = one_bg2 },
   NvimTreeNormal = { bg = darker_black },
   NvimTreeNormalNC = { bg = darker_black },
   NvimTreeOpenedFolderName = { fg = folder_bg },

   NvimTreeWinSeparator = {
      fg = darker_black,
      bg = darker_black,
   },

   NvimTreeWindowPicker = {
      fg = red,
      bg = black2,
   },

   -- Telescope
   TelescopeBorder = {
      fg = darker_black,
      bg = darker_black,
   },

   TelescopePromptBorder = {
      fg = black2,
      bg = black2,
   },

   TelescopePromptNormal = {
      fg = white,
      bg = black2,
   },

   TelescopePromptPrefix = {
      fg = red,
      bg = black2,
   },

   TelescopeNormal = { bg = darker_black },

   TelescopePreviewTitle = {
      fg = black,
      bg = green,
   },

   TelescopePromptTitle = {
      fg = black,
      bg = red,
   },

   TelescopeResultsTitle = {
      fg = darker_black,
      bg = darker_black,
   },

   TelescopeSelection = { bg = black2 },

   -- Octo
   OctoEditable = { bg = darker_black },
   OctoGreenFloat = { bg = darker_black },
   OctoRedFloat = { bg = darker_black },
   OctoPurpleFloat = { bg = darker_black },
   OctoYellowFloat = { bg = darker_black },
   OctoBlueFloat = { bg = darker_black },
   OctoGreyFloat = { bg = darker_black },
}

if ui.transparency then
   local hl_groups = {
      "NormalFloat",
      "Normal",
      "Folded",
      "NvimTreeNormal",
      "NvimTreeNormalNC",
      "TelescopeNormal",
      "TelescopePrompt",
      "TelescopeResults",
      "TelescopeBorder",
      "TelescopePromptBorder",
      "TelescopePromptNormal",
      "TelescopePromptPrefix",
   }

   for index, _ in ipairs(hl_groups) do
      hl_cols[hl_groups[index]] = {
         bg = "NONE",
      }
   end

   hl_cols.NvimTreeWinSeparator = {
      fg = grey,
      bg = "NONE",
   }

   hl_cols.TelescopeResultsTitle = {
      fg = black,
      bg = blue,
   }
end

local utils = require "core.utils"
local user_highlights = utils.load_config().ui.hl_override

-- override user highlights if there are any
hl_cols = vim.tbl_deep_extend("force", hl_cols, user_highlights)

for hl, col in pairs(hl_cols) do
   vim.api.nvim_set_hl(0, hl, col)
end
