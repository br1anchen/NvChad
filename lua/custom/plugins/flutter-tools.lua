local M = {}

function M.setup(attach, capabilities)
   require("flutter-tools").setup {
      widget_guides = {
         enabled = true,
      },
      debugger = { -- integrate with nvim dap + install dart code debugger
         enabled = true,
         run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
      },
      lsp = {
         on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
            attach(client, bufnr)
         end,
         capabilities = capabilities,
      },
   }
   require("telescope").load_extension "flutter"
end

return M
