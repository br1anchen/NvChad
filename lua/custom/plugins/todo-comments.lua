local todo = require "todo-comments"
local map = nvchad.map
local M = {}

function M.setup()
   todo.setup {
      -- highlighting of the line containing the todo comment
      -- * before: highlights before the keyword (typically comment characters)
      -- * keyword: highlights of the keyword
      -- * after: highlights after the keyword (todo text)
      highlight = {
         before = "", -- "fg" or "bg" or empty
         keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
         after = "fg", -- "fg" or "bg" or empty
         pattern = [[.*<(KEYWORDS)(\([^\)]*\))?(\s\d*)?:]], -- pattern or table of patterns, used for highlightng (vim regex)
         comments_only = true, -- uses treesitter to match keywords in comments only
         max_line_len = 400, -- ignore lines longer than this
         exclude = {}, -- list of file types to exclude highlighting
      },
      search = {
         command = "rg",
         args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
         },
         -- regex that will be used to match keywords.
         -- don't replace the (KEYWORDS) placeholder
         pattern = [[\b(KEYWORDS)(\([^\)]*\))?(\s\d*)?:]], -- ripgrep regex
         -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      },
   }

   local opts = { noremap = true, silent = true, nowait = false }
   map("n", "<leader>ftd", ":TodoTelescope<CR>", opts)
   map("n", "<leader>xt", ":TodoTrouble<CR>", opts)
end

return M
