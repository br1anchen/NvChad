local ok, null_ls = pcall(require, "null-ls")

if not ok then
  return
end

local b = null_ls.builtins
local helpers = require "null-ls.helpers"
local methods = require "null-ls.methods"

local swiftLint = {
  name = "swiftLint",
  meta = {
    url = "https://github.com/realm/SwiftLint",
    description = "A tool to enforce Swift style and conventions, loosely based on the now archived GitHub Swift Style Guide. SwiftLint enforces the style guide rules that are generally accepted by the Swift community.",
  },
  method = methods.DIAGNOSTICS,
  filetype = { "swift" },
  generator_opts = {
    command = "swiftlint",
    args = {
      "lint",
      "--quiet",
      "--reporter",
      "json",
      "$FILENAME",
    },
    format = "json_raw",
    on_output = function(params)
      params.messages = params.output and params.output[1] and params.output[1].messages or {}
      if params.err then
        table.insert(params.messages, { message = params.err })
      end

      local parser = helpers.diagnostics.from_json {
        attributes = {
          severity = "severity",
        },
        severities = {
          helpers.diagnostics.severities["warning"],
          helpers.diagnostics.severities["error"],
        },
      }

      return parser { output = params.messages }
    end,
  },
  factory = helpers.generator_factory,
}

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

  -- Python
  b.formatting.black,

  -- Swift/Obj-c
  b.formatting.swiftformat,

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
  null_ls.register(swiftLint)

  null_ls.setup {
    debounce = 250,
    sources = sources,
    update_in_insert = true,
    on_attach = function(client)
      if client.server_capabilities.documentFormattingProvider then
        local vim_version = vim.version()

        if vim_version.minor > 7 then
          -- nightly
          vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.format()"
        else
          -- stable
          vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync { async = true }"
        end
      end
    end,
  }
end

return M
