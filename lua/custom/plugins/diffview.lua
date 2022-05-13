local ok, diffview = pcall(require, "diffview")

if not ok then
   return
end

local M = {}

M.setup = function()
   diffview.setup {}
end

return M
