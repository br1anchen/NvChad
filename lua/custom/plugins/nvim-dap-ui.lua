local M = {}

function M.setup()
   require("dapui").setup {
      sidebar = {
         size = 40,
         position = "right", -- Can be "left", "right", "top", "bottom"
      },
   }
end

return M
