local overrides = require "custom.plugins.overrides"

return {
  -- overrides Nvchad plugins install
  ["wbthomason/packer.nvim"] = { override_options = overrides.packer },
  ["lewis6991/impatient.nvim"] = { disable = true },
  ["goolord/alpha-nvim"] = { disable = false },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require("custom.plugins.lspconfig").setup()
    end,
  },
  ["williamboman/mason.nvim"] = {
    requires = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local mason_lspconfig = require("custom.plugins.overrides").mason_lspconfig
      require("mason").setup()
      require("mason-lspconfig").setup(mason_lspconfig)
    end,
    override_options = overrides.mason,
  },
  ["WhoIsSethDaniel/mason-tool-installer.nvim"] = {
    after = { "mason.nvim" },
    config = function()
      require("mason-tool-installer").setup {
        ensure_installed = {
          "eslint_d",
          "prettierd",
          "luacheck",
          "stylua",
          "shellcheck",
          "shfmt",
          "black",
          "sqlfluff",
          "xmlformatter",
        },
        run_on_start = true,
        auto_update = true,
      }
    end,
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },
  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },
  ["NvChad/nvim-colorizer.lua"] = {
    override_options = overrides.colorizer,
  },
  ["NvChad/nvterm"] = {
    override_options = overrides.nvterm,
  },

  ["nvim-telescope/telescope.nvim"] = {
    after = "base46",
    override_options = overrides.telescope,
  },
  ["folke/which-key.nvim"] = {
    disable = false,
    override_options = overrides.whichkey,
    config = function()
      require "plugins.configs.whichkey"
      require("custom.plugins.whichkey").custom()
    end,
  },
  ["lewis6991/gitsigns.nvim"] = {
    override_options = overrides.gitsigns,
  },
  ["hrsh7th/nvim-cmp"] = {
    override_options = overrides.cmp,
  },

  -- custom plugins
  ["elkowar/yuck.vim"] = { ft = "yuck" },
  ["ellisonleao/glow.nvim"] = {
    cmd = "Glow",
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  },
  ["tami5/lspsaga.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.lspsaga").setup()
    end,
  },
  ["https://git.sr.ht/~whynothugo/lsp_lines.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      vim.diagnostic.config {
        virtual_text = false,
      }
      require("lsp_lines").setup()
    end,
  },

  ["nvim-treesitter/nvim-treesitter-textobjects"] = { after = "nvim-treesitter" },
  ["ziontee113/syntax-tree-surfer"] = { after = "nvim-treesitter" },
  ["nvim-treesitter/playground"] = {
    after = "nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup {
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },
      }
    end,
  },
  ["nvim-treesitter/nvim-treesitter-context"] = {
    after = "nvim-treesitter",
    config = function()
      require("treesitter-context").setup()
    end,
  },

  ["nvim-telescope/telescope-dap.nvim"] = {
    module = "telescope._extensions.dap",
  },

  ["nvim-telescope/telescope-file-browser.nvim"] = {
    module = "telescope._extensions.file_browser",
  },

  ["rhysd/git-messenger.vim"] = {},

  ["mbbill/undotree"] = {},

  -- ["github/copilot.vim"] = {
  --   config = function()
  --     vim.cmd "let g:copilot_no_tab_map = v:true"
  --     vim.cmd "let g:copilot_assume_mapped = v:true"
  --   end,
  -- },
  ["zbirenbaum/copilot.lua"] = {
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  },

  ["zbirenbaum/copilot-cmp"] = {
    after = { "copilot.lua", "nvim-cmp" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  -- ["hrsh7th/cmp-copilot"] = {
  --   after = "nvim-cmp",
  -- },

  ["hrsh7th/cmp-emoji"] = {
    after = "nvim-cmp",
  },

  ["folke/trouble.nvim"] = {
    after = "nvim-web-devicons",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end,
  },

  ["tpope/vim-abolish"] = {},

  ["akinsho/flutter-tools.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    ft = "dart",
    event = "BufRead pubspec.yaml",
    module = "flutter-tools",
    config = function()
      require("custom.plugins.flutter-tools").setup()
    end,
  },

  ["simrat39/rust-tools.nvim"] = {
    after = "nvim-lspconfig",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("custom.plugins.rust-tools").setup()
    end,
  },

  ["saecki/crates.nvim"] = {
    event = { "BufRead Cargo.toml" },
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      }
    end,
  },

  ["nanotee/sqls.nvim"] = {},

  -- {
  --    "Pocco81/DAPInstall.nvim",
  --    config = function()
  --       require("custom.plugins.dap-install").setup()
  --    end,
  -- },

  ["mfussenegger/nvim-dap"] = {},
  ["rcarriga/nvim-dap-ui"] = {
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("custom.plugins.nvim-dap-ui").setup()
    end,
  },

  ["kylechui/nvim-surround"] = {
    config = function()
      require("nvim-surround").setup {}
    end,
    event = "BufEnter",
  },

  ["windwp/nvim-spectre"] = {
    after = "base46",
    requires = {
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("spectre").setup()
    end,
  },

  ["ggandor/leap.nvim"] = {},

  ["karb94/neoscroll.nvim"] = {
    config = function()
      require("neoscroll").setup()
    end,
  },

  ["ron-rs/ron.vim"] = {
    after = "nvim-lspconfig",
  },

  ["folke/todo-comments.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("custom.plugins.todo-comments").setup()
    end,
  },

  ["skywind3000/asyncrun.vim"] = {
    setup = function()
      vim.g.asyncrun_open = 6
    end,
  },
  ["skywind3000/asynctasks.vim"] = {
    requires = "skywind3000/asyncrun.vim",
    setup = function()
      vim.g.asyncrun_rootmarks = { ".git", ".svn", ".root", ".project", ".hg", ".vscode" }
    end,
  },
  ["GustavoKatel/telescope-asynctasks.nvim"] = {
    module = "telescope._extensions.asynctasks",
  },

  ["ntpeters/vim-better-whitespace"] = {
    config = function()
      vim.g.better_whitespace_enabled = 1
      vim.g.strip_whitespace_on_save = 1
      vim.g.strip_whitespace_confirm = 0
    end,
  },

  ["natecraddock/workspaces.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("workspaces").setup()
    end,
  },

  ["stevearc/aerial.nvim"] = {
    after = "base46",
    config = function()
      require("aerial").setup {
        on_attach = function(bufnr)
          -- Toggle the aerial window with <leader>a
          vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>a", "<cmd>AerialToggle!<CR>", {})
          -- Jump forwards/backwards with '{' and '}'
          vim.api.nvim_buf_set_keymap(bufnr, "n", "{", "<cmd>AerialPrev<CR>", {})
          vim.api.nvim_buf_set_keymap(bufnr, "n", "}", "<cmd>AerialNext<CR>", {})
          -- Jump up the tree with '[[' or ']]'
          vim.api.nvim_buf_set_keymap(bufnr, "n", "[[", "<cmd>AerialPrevUp<CR>", {})
          vim.api.nvim_buf_set_keymap(bufnr, "n", "]]", "<cmd>AerialNextUp<CR>", {})
        end,
      }
    end,
  },

  ["AckslD/nvim-neoclip.lua"] = {
    after = "telescope.nvim",
    requires = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("custom.plugins.nvim-neoclip").setup()
    end,
  },

  ["br1anchen/octo.nvim"] = {
    after = "telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("custom.plugins.octo").setup()
    end,
  },

  -- ["hkupty/iron.nvim"] = {
  --   config = function()
  --     require("custom.plugins.iron").setup()
  --   end,
  -- },

  ["untitled-ai/jupyter_ascending.vim"] = {},
  ["bfredl/nvim-ipy"] = {
    config = function()
      vim.g.nvim_ipy_perform_mappings = 0
      vim.g.ipy_celldef = "# %%"
    end,
  },
  ["kana/vim-textobj-line"] = {},
  ["kana/vim-textobj-user"] = {},
  ["GCBallesteros/vim-textobj-hydrogen"] = {},
  ["GCBallesteros/jupytext.vim"] = {
    setup = function()
      vim.g.jupytext_fmt = "py"
      vim.g.jupytext_style = "hydrogen"
    end,
  },

  ["max397574/better-escape.nvim"] = {
    event = "InsertCharPre",
    config = function()
      require("custom.plugins.butter-escape").setup()
    end,
  },

  ["sindrets/winshift.nvim"] = {
    config = function()
      require("custom.plugins.winshift").setup()
    end,
  },

  ["lervag/vimtex"] = {
    config = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_quickfix_enabled = 0
      vim.cmd "set conceallevel=2"
    end,
  },

  ["br1anchen/git-worktree.nvim"] = {
    branch = "brian/tmp/fix-97",
    after = "telescope.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("custom.plugins.git-worktree").setup()
    end,
  },
}
