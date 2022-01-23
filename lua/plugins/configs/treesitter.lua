local present, ts_config = pcall(require, "nvim-treesitter.configs")
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

if not present then
   return
end

local default = {
   ensure_installed = {
      "lua",
      "vim",
      "org",
   },
   highlight = {
      enable = true,
      use_languagetree = true,
      disable = { "org" },
      additional_vim_regex_highlighting = { "org" },
   },
}

local M = {}
M.setup = function(override_flag)
   if override_flag then
      default = require("core.utils").tbl_override_req("nvim_treesitter", default)
   end

   parser_config.org = {
      install_info = {
         url = "https://github.com/milisims/tree-sitter-org",
         revision = "f110024d539e676f25b72b7c80b0fd43c34264ef",
         files = { "src/parser.c", "src/scanner.cc" },
      },
      filetype = "org",
   }

   ts_config.setup(default)
end

return M
