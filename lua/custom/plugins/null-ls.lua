local ok, null_ls = pcall(require, "null-ls")

if not ok then
  return
end

local b = null_ls.builtins
local helpers = require "null-ls.helpers"

local swiftLint = {
  name = "SwiftLint",
  meta = {
    url = "https://github.com/realm/SwiftLint",
    description = "A tool to enforce Swift style and conventions, loosely based on the now archived GitHub Swift Style Guide. SwiftLint enforces the style guide rules that are generally accepted by the Swift community.",
  },
  method = null_ls.methods.DIAGNOSTICS,
  filetypes = { "swift" },
  generator = helpers.generator_factory {
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
      --[[
        [{
          "character" : 84,
          "file" : "\/Users\/br1anchen\/Documents\/tmp\/ios\/Runner\/AppDelegate.swift",
          "line" : 13,
          "reason" : "Force casts should be avoided.",
          "rule_id" : "force_cast",
          "severity" : "Error",
          "type" : "Force Cast"
        }]
      ]]

      local output = params.output and params.output[1] and params.output[1].messages or {}
      if params.err then
        output = vim.json.decode(params.err)
      end

      local parser = helpers.diagnostics.from_json {
        attributes = {
          col = "character",
          row = "line",
          message = "reason",
        },
        severities = {
          ["Warning"] = helpers.diagnostics.severities["warning"],
          ["Error"] = helpers.diagnostics.severities["error"],
        },
      }

      return parser { output = output }
    end,
  },
}

local xmlformatter = {
  name = "xmlformatter",
  method = null_ls.methods.FORMATTING,
  filetypes = { "xml" },
  generator = helpers.formatter_factory {
    command = "xmlformat",
    args = { "--indent", "4", "$FILENAME" },
    to_stdin = true,
  },
}

local sources = {

  -- JS html css stuff
  b.formatting.prettierd.with {
    filetypes = {
      "astro",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "css",
      "scss",
      "less",
      "html",
      "json",
      "jsonc",
      "yaml",
      "markdown",
      "markdown.mdx",
      "graphql",
      "handlebars",
    },
  },
  b.diagnostics.eslint,

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
  swiftLint,

  -- XML
  xmlformatter,

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
