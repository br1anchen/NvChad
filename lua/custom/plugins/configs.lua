local M = {}

-- overriding default plugin configs!
M.treesitter = {
  ensure_installed = {
    "css",
    "html",
    "java",
    "javascript",
    "json",
    "kotlin",
    "latex",
    "lua",
    "markdown",
    "nix",
    "python",
    "rust",
    "swift",
    "toml",
    "typescript",
    "vim",
    "yaml",
  },

  highlight = {
    disable = { "dart" },
  },
}

M.nvimtree = {
  git = { enable = true },
  view = { side = "right", width = 20 },
}

M.colorizer = {
  filetypes = {
    "*",
    dart = { AARRGGBB = true },
  },
  user_default_options = {
    mode = "virtualtext",
  },
}

M.mason_lspconfig = {
  ensure_installed = {
    "bashls",
    "dartls",
    "html",
    "jsonls",
    "lemminx",
    "prismals",
    "pyright",
    "rnix",
    "rust_analyzer",
    "sqls",
    "stylelint_lsp",
    "sumneko_lua",
    "taplo",
    "texlab",
    "tsserver",
    "yamlls",
    "marksman",
    "sourcekit",
  },
  automatic_installation = false,
}

M.telescope = {
  extensions_list = {
    "themes",
    "terms",
    "flutter",
    "workspaces",
    "dap",
    "neoclip",
    "file_browser",
  },
}

M.whichkey = {
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    i = { "j", "k" },
    v = { "j", "k" },
    t = { "j", "k", "<space>" },
  },
}

M.gitsigns = {
  signs = {
    add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr" },
    delete = { hl = "GitSignsDelete", text = "", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr" },
  },
}

M.cmp = {
  sources = {
    { name = "nvim_lsp" },
    { name = "copilot" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "emoji" },
    { name = "path" },
    { name = "crates" },
  },
  formatting = {
    format = function(entry, vim_item)
      if entry.source.name == "copilot" then
        vim_item.kind = string.format("%s %s", "", "Copilot")
        vim_item.kind_hl_group = "CmpItemKindCopilot"
        return vim_item
      end

      local icons = require("nvchad_ui.icons").lspkind
      vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
      return vim_item
    end,
  },
}

M.nvterm = {
  terminals = {
    type_opts = {
      float = {
        relative = "editor",
        row = 0.1,
        col = 0.25,
        width = 0.5,
        height = 0.7,
        border = "single",
      },
    },
  },
}

M.mason = {
  ensure_installed = {},
}

return M
