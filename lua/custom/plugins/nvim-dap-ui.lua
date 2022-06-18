local M = {}

function M.setup()
   require("dapui").setup {
      layouts = {
         {
            elements = {
               -- Elements can be strings or table with id and size keys.
               { id = "scopes", size = 0.25 },
               "breakpoints",
               "stacks",
               "watches",
            },
            size = 40,
            position = "right",
         },
         {
            elements = {
               "repl",
               "console",
            },
            size = 10,
            position = "bottom",
         },
      },
   }
end

return M
