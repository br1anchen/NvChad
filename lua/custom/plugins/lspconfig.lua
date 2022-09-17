local attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local installed_lsp = require("custom.plugins.overrides").mason_lspconfig.ensure_installed

local M = {}

M.on_attach = function(client, bufnr)
  require("aerial").on_attach(client, bufnr)
  attach(client, bufnr)
end

M.flags = {
  debounce_text_changes = 150,
}

M.handlers = {
  ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Disable virtual_text
    virtual_text = false,
  }),
}

M.capabilities = capabilities

M.setup = function()
  for _, lsp in ipairs(installed_lsp) do
    if
      lsp ~= "sqls"
      and lsp ~= "sumneko_lua"
      and lsp ~= "stylelint_lsp"
      and lsp ~= "sqls"
      and lsp ~= "rust_analyzer"
      and lsp ~= "sourcekit"
      and lsp ~= "dartls"
    then
      lspconfig[lsp].setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
        flags = M.flags,
        handlers = M.handlers,
      }
    end
  end

  lspconfig.sumneko_lua.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    handlers = M.handlers,

    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  }

  lspconfig.stylelint_lsp.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    flags = M.flags,
    handlers = M.handlers,
    filetypes = { "scss", "less", "css", "sass" },
  }

  lspconfig.sqls.setup {
    on_attach = function(client, bufnr)
      require("sqls").on_attach(client, bufnr)
      M.on_attach(client, bufnr)
    end,
    capabilities = M.capabilities,
    flags = M.flags,
    handlers = M.handlers,
  }

  lspconfig.sourcekit.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    flags = M.flags,
    handlers = M.handlers,
    cmd = { "xcrun", "sourcekit-lsp" },
    root_dir = lspconfig.util.root_pattern("Package.swift", ".git", ".gitignore"),
  }
end

return M
