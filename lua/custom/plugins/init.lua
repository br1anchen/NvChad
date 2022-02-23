return {
   { "elkowar/yuck.vim", ft = "yuck" },
   { "ellisonleao/glow.nvim", cmd = "Glow" },

   { "kdheepak/lazygit.nvim" },

   { "williamboman/nvim-lsp-installer" },

   {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },
   {
      "tami5/lspsaga.nvim",
      requires = {
         "neovim/nvim-lspconfig",
      },
      config = function()
         require("custom.plugins.lspsaga").setup()
      end,
   },

   {
      "sudormrfbin/cheatsheet.nvim",
      requires = { { "nvim-telescope/telescope.nvim" }, { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
   },

   {
      "nvim-telescope/telescope-dap.nvim",
      after = "telescope.nvim",
      requires = "nvim-telescope/telescope.nvim",
      config = function()
         require("custom.plugins.telescope-dap").setup()
      end,
   },

   {
      "nvim-telescope/telescope-file-browser.nvim",
      after = "telescope.nvim",
      requires = "nvim-telescope/telescope.nvim",
      config = function()
         require("custom.plugins.telescope-file-browser").setup()
      end,
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

   {
      "tzachar/cmp-tabnine",
      run = "./install.sh",
      after = "nvim-cmp",
      requires = "hrsh7th/nvim-cmp",
      config = function()
         require("custom.plugins.cmp-tabnine").setup()
      end,
   },

   {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
         require("custom.plugins.trouble").setup()
      end,
   },

   { "tpope/vim-abolish" },

   { "rrethy/vim-hexokinase", run = "make hexokinase" },

   {
      "br1anchen/flutter-tools.nvim",
      requires = "nvim-lua/plenary.nvim",
   },

   {
      "simrat39/rust-tools.nvim",
      after = "nvim-lspconfig",
      requires = "nvim-lua/plenary.nvim",
   },

   {
      "Pocco81/DAPInstall.nvim",
      config = function()
         require("custom.plugins.dap-install").setup()
      end,
   },

   {
      "mfussenegger/nvim-dap",
      config = function()
         require("custom.plugins.nvim-dap").setup()
      end,
   },
   {
      "rcarriga/nvim-dap-ui",
      requires = { "mfussenegger/nvim-dap" },
      config = function()
         require("custom.plugins.nvim-dap-ui").setup()
      end,
   },

   { "tpope/vim-surround" },

   { "MunifTanjim/nui.nvim" },
   {
      "VonHeikemen/searchbox.nvim",
      requires = {
         { "MunifTanjim/nui.nvim" },
      },
      config = function()
         require("custom.plugins.searchbox").setup()
      end,
   },

   { "ggandor/lightspeed.nvim" },

   {
      "karb94/neoscroll.nvim",
      opt = true,
      config = function()
         require("neoscroll").setup()
      end,

      -- lazy loading
      setup = function()
         require("core.utils").packer_lazy_load "neoscroll.nvim"
      end,
   },

   { "ron-rs/ron.vim" },

   {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
         require("custom.plugins.todo-comments").setup()
      end,
   },

   {
      "skywind3000/asyncrun.vim",
      setup = function()
         vim.cmd "let g:asyncrun_open = 6"
      end,
   },
   {
      "skywind3000/asynctasks.vim",
      requires = "skywind3000/asyncrun.vim",
      setup = function()
         vim.cmd "let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg', '.gitignore']"
      end,
   },

   {
      "ntpeters/vim-better-whitespace",
      config = function()
         vim.cmd "let g:better_whitespace_enabled=1"
         vim.cmd "let g:strip_whitespace_on_save=1"
         vim.cmd "let g:strip_whitespace_confirm=0"
      end,
   },

   {
      "natecraddock/workspaces.nvim",
      config = function()
         require("workspaces").setup()
      end,
   },

   {
      "stevearc/aerial.nvim",
      after = "nvim-lspconfig",
   },

   {
      "wfxr/minimap.vim",
      config = function()
         vim.cmd "let g:minimap_width = 10"
         vim.cmd "let g:minimap_auto_start = 1"
         vim.cmd "let g:minimap_auto_start_win_enter = 1"
      end,
   },
}
