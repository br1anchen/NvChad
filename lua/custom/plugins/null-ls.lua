local ok, null_ls = pcall(require, "null-ls")

if not ok then
   return
end

local b = null_ls.builtins

local sources = {

   -- JS html css stuff
   b.formatting.prettierd,
   b.diagnostics.eslint.with { command = "eslint_d" },

   -- Lua
   b.formatting.stylua,
   b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

   -- Rust
   b.formatting.rustfmt,

   -- CSS
   b.diagnostics.stylelint,
   b.formatting.stylelint,

   -- Dart
   b.formatting.dart_format,

   -- Nix
   b.formatting.nixfmt,
   b.diagnostics.statix,

   -- SQL
   b.formatting.sqlfluff.with {
      extra_args = { "--dialect", "mysql" }, -- change to your dialect
   },
   b.diagnostics.sqlfluff.with {
      extra_args = { "--dialect", "mysql" }, -- change to your dialect
   },
}

local M = {}

M.setup = function()
   null_ls.setup {
      sources = sources,
      on_attach = function(client)
         if client.resolved_capabilities.document_formatting then
            vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
         end
      end,
   }
end

return M
