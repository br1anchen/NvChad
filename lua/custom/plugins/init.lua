return {
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
      requires = {
         "neovim/nvim-lspconfig",
      },
      config = function()
         require("custom.plugins.lspsaga").setup()
      end,
   },

   ["sudormrfbin/cheatsheet.nvim"] = {
      requires = { { "nvim-telescope/telescope.nvim" }, { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
   },

   ["nvim-telescope/telescope-dap.nvim"] = {
      after = "telescope.nvim",
      requires = "nvim-telescope/telescope.nvim",
   },

   ["nvim-telescope/telescope-file-browser.nvim"] = {
      after = "telescope.nvim",
      requires = "nvim-telescope/telescope.nvim",
   },

   -- use {
   --    "github/copilot.vim",
   --    config = function()
   --       vim.cmd "let g:copilot_no_tab_map = v:true"
   --       vim.cmd "let g:copilot_assume_mapped = v:true"
   --    end,
   -- }
   --
   -- use {
   --    "hrsh7th/cmp-copilot",
   --    after = "nvim-cmp",
   -- }

   ["tzachar/cmp-tabnine"] = {
      run = "./install.sh",
      after = "nvim-cmp",
      requires = "hrsh7th/nvim-cmp",
      config = function()
         require("custom.plugins.cmp-tabnine").setup()
      end,
   },

   ["folke/trouble.nvim"] = {
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
         require("trouble").setup()
      end,
   },

   ["tpope/vim-abolish"] = {},

   ["akinsho/flutter-tools.nvim"] = {
      after = "nvim-lspconfig",
      requires = "nvim-lua/plenary.nvim",
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

   ["tpope/vim-surround"] = {},

   ["MunifTanjim/nui.nvim"] = {},
   ["VonHeikemen/searchbox.nvim"] = {
      requires = {
         { "MunifTanjim/nui.nvim" },
      },
      config = function()
         require("searchbox").setup()
      end,
   },

   ["ggandor/lightspeed.nvim"] = {},

   ["karb94/neoscroll.nvim"] = {
      opt = true,
      config = function()
         require("neoscroll").setup()
      end,

      -- lazy loading
      setup = function()
         require("core.utils").packer_lazy_load "neoscroll.nvim"
      end,
   },

   ["ron-rs/ron.vim"] = {},

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
      requires = "nvim-telescope/telescope.nvim",
   },

   ["ntpeters/vim-better-whitespace"] = {
      config = function()
         vim.g.better_whitespace_enabled = 1
         vim.g.strip_whitespace_on_save = 1
         vim.g.strip_whitespace_confirm = 0
      end,
   },

   ["natecraddock/workspaces.nvim"] = {
      config = function()
         require("workspaces").setup()
      end,
   },

   ["stevearc/aerial.nvim"] = {
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
      requires = {
         { "nvim-telescope/telescope.nvim" },
      },
      config = function()
         require("custom.plugins.nvim-neoclip").setup()
      end,
   },

   ["voldikss/vim-floaterm"] = {},

   ["pwntester/octo.nvim"] = {
      requires = {
         "nvim-lua/plenary.nvim",
         "nvim-telescope/telescope.nvim",
         "kyazdani42/nvim-web-devicons",
      },
      config = function()
         require("custom.plugins.octo").setup()
      end,
   },

   ["sindrets/diffview.nvim"] = {
      requires = "nvim-lua/plenary.nvim",
      config = function()
         require("diffview").setup()
      end,
   },

   ["xiyaowong/telescope-emoji.nvim"] = {
      requires = "nvim-telescope/telescope.nvim",
   },

   ["hkupty/iron.nvim"] = {
      config = function()
         require("custom.plugins.iron").setup()
      end,
   },

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

   ["dart-lang/dart-vim-plugin"] = {
      setup = function()
         vim.g.dart_html_in_string = true
      end,
   },

   ["max397574/better-escape.nvim"] = {
      event = "InsertCharPre",
      config = function()
         require("custom.plugins.butter-escape").setup()
      end,
   },
}
