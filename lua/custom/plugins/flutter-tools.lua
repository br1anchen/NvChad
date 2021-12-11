local M = {}

function M.setup(on_attach, capabilities)
   require("flutter-tools").setup {
      widget_guides = {
         enabled = true,
      },
      debugger = { -- integrate with nvim dap + install dart code debugger
         enabled = true,
         run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
      },
      lsp = {
         on_attach = on_attach,
         capabilities = capabilities,
      },
   }
   require("telescope").load_extension "flutter"
end

return M
