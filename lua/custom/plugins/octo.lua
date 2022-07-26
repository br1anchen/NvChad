local ok, octo = pcall(require, "octo")

if not ok then
  return
end

local M = {}

M.setup = function()
  octo.setup {}
end

return M
