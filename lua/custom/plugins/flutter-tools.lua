local M = {}

function M.setup()
   require("flutter-tools").setup {
      widget_guides = {
         enabled = true,
      },
      debugger = { -- integrate with nvim dap + install dart code debugger
         enabled = true,
         run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
      },
   }
   require("telescope").load_extension "flutter"
end

return M
