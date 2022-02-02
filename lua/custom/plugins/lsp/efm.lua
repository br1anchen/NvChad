-- Example configuations here: https://github.com/mattn/efm-langserver
-- TODO this file needs to be refactored eache lang should be it's own file
-- python
local python_arguments = {}

-- TODO replace with path argument
local flake8 = {
   LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
   lintStdin = true,
   lintFormats = { "%f:%l:%c: %m" },
}

-- local isort = {formatCommand = "isort --quiet -", formatStdin = true}

local yapf = { formatCommand = "yapf --quiet", formatStdin = true }
-- local black = {formatCommand = "black --quiet -", formatStdin = true}

table.insert(python_arguments, flake8)

table.insert(python_arguments, yapf)

-- lua
local lua_arguments = {}

local luaFormat = {
   formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
   formatStdin = true,
}

local lua_fmt = { formatCommand = "luafmt --indent-count 2 --line-width 120 --stdin", formatStdin = true }

local stylua = { formatCommand = "stylua -s -", formatStdin = true }

table.insert(lua_arguments, stylua)

-- sh
local sh_arguments = {}

local shfmt = { formatCommand = "shfmt -ci -s -bn", formatStdin = true }

local shellcheck = {
   LintCommand = "shellcheck -f gcc -x",
   lintFormats = { "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m" },
}

table.insert(sh_arguments, shfmt)

table.insert(sh_arguments, shellcheck)

-- tsserver/web javascript react, vue, json, html, css, yaml
local prettier = { formatCommand = "prettierd ${INPUT}", formatStdin = true }
-- You can look for project scope Prettier and Eslint with e.g. vim.fn.glob("node_modules/.bin/prettier") etc. If it is not found revert to global Prettier where needed.
-- local prettier = {formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}", formatStdin = true}

-- local eslint = {
--     lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
--     lintIgnoreExitCode = true,
--     lintStdin = true,
--     lintFormats = {"%f:%l:%c: %m"},
--     formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
--     formatStdin = true
-- }

local eslint = {
   lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
   -- lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
   lintIgnoreExitCode = true,
   lintStdin = true,
   lintFormats = { "%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m" },
   formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
   formatStdin = true,
}

local tsserver_args = {}

table.insert(tsserver_args, prettier)

table.insert(tsserver_args, eslint)

local css_args = {}

local stylelint = {
   lintCommand = "stylelint --stdin --stdin-filename ${INPUT} --formatter compact",
   lintIgnoreExitCode = true,
   lintStdin = true,
   lintFormats = { "%f: line %l, col %c, %tarning - %m", "%f: line %l, col %c, %trror - %m" },
   formatCommand = "stylelint --fix --stdin --stdin-filename ${INPUT}",
   formatStdin = true,
}

table.insert(css_args, stylelint)

-- local markdownlint = {
--     -- TODO default to global lintrc
--     -- lintcommand = 'markdownlint -s -c ./markdownlintrc',
--     lintCommand = 'markdownlint -s',
--     lintStdin = true,
--     lintFormats = {'%f:%l %m', '%f:%l:%c %m', '%f: %l: %m'}
-- }

local markdownPandocFormat = { formatCommand = "pandoc -f markdown -t gfm -sp --tab-stop=2", formatStdin = true }

return {
   init_options = { documentFormatting = true, codeAction = false },
   filetypes = {
      "lua",
      "python",
      "javascriptreact",
      "javascript",
      "typescript",
      "typescriptreact",
      "sh",
      "html",
      "css",
      "json",
      "yaml",
      "markdown",
      "vue",
   },
   settings = {
      rootMarkers = { ".git/" },
      languages = {
         python = python_arguments,
         lua = lua_arguments,
         sh = sh_arguments,
         javascript = tsserver_args,
         javascriptreact = tsserver_args,
         typescript = tsserver_args,
         typescriptreact = tsserver_args,
         html = { prettier },
         css = css_args,
         json = { prettier },
         yaml = { prettier },
         markdown = { markdownPandocFormat },
      },
   },
}
