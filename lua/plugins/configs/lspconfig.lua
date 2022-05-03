local M = {}

require("plugins.configs.others").lsp_handlers()

local lsp_formatting = function(bufnr)
   vim.lsp.buf.format {
      filter = function(clients)
         -- filter out clients that you don't want to use
         return vim.tbl_filter(function(client)
            return client.name == "null-ls"
         end, clients)
      end,
      bufnr = bufnr,
   }
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

function M.on_attach(client, bufnr)
   if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
         buffer = bufnr,
         callback = function()
            lsp_formatting(bufnr)
         end,
      })
   end

   require("core.mappings").lspconfig()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
   properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
   },
}

-- requires a file containing user's lspconfigs
local addlsp_confs = require("core.utils").load_config().plugins.options.lspconfig.setup_lspconf

if #addlsp_confs ~= 0 then
   require(addlsp_confs).setup_lsp(M.on_attach, capabilities)
end

return M
