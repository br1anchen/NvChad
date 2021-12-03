local M = {}

function M.setup()
   require("flutter-tools").setup {}
   require("telescope").load_extension "flutter"
end

return M
