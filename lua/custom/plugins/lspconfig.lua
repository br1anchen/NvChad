local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"
   local installed_lsp = require("custom.plugins.configs").lsp_installer.ensure_installed

   local custom_on_attach = function(client, bufnr)
      require("aerial").on_attach(client, bufnr)
      attach(client, bufnr)
   end

   local flags = {
      debounce_text_changes = 150,
   }

   for _, lsp in ipairs(installed_lsp) do
      if
         lsp ~= "sumneko_lua"
         and lsp ~= "stylelint_lsp"
         and lsp ~= "sqls"
         and lsp ~= "dartls"
         and lsp ~= "rust_analyzer"
      then
         lspconfig[lsp].setup {
            on_attach = custom_on_attach,
            capabilities = capabilities,
            flags = flags,
         }
      end
   end

   lspconfig.stylelint_lsp.setup {
      on_attach = custom_on_attach,
      capabilities = capabilities,
      flags = flags,
      filetypes = { "scss", "less", "css", "sass" },
   }

   lspconfig.sqls.setup {
      on_attach = function(client, bufnr)
         require("sqls").on_attach(client, bufnr)
         custom_on_attach(client, bufnr)
      end,
      capabilities = capabilities,
      flags = flags,
   }
end

return M
