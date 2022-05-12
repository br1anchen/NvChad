return {
   ["nvim-telescope/telescope.nvim"] = {
      setup = function()
         -- load default mappings first
         require("core.mappings").telescope()
         -- then load your mappings
         local map = nvchad.map
         map("n", "<leader>fc", "<cmd>lua require('telescope.builtin').git_commits()<cr>")
         map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').git_status()<cr>")
         map("n", "<leader>ft", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
         map("n", "<leader>fv", "<cmd>lua require('telescope').extensions.themes.themes()<cr>")
         map("n", "<leader>fw", "<cmd>lua require('telescope.builtin').grep_string()<cr>")
         map("n", "<leader>fl", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>")
         map("n", "<leader>fj", "<cmd>lua require('telescope').extensions.emoji.emoji()<cr>")
      end,
   },
   ["elkowar/yuck.vim"] = { ft = "yuck" },
   ["ellisonleao/glow.nvim"] = {
      cmd = "Glow",
      config = function()
         local map = nvchad.map
         map("n", "<leader>p", ":Glow<CR>")
      end,
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
      config = function()
         require("custom.plugins.telescope-dap").setup()
      end,
   },

   ["nvim-telescope/telescope-file-browser.nvim"] = {
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
         require("custom.plugins.trouble").setup()
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

   ["mfussenegger/nvim-dap"] = {
      config = function()
         require("custom.plugins.nvim-dap").setup()
      end,
   },
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
         require("custom.plugins.searchbox").setup()
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
         nvchad.packer_lazy_load "neoscroll.nvim"
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
         vim.cmd "let g:asyncrun_open = 6"
      end,
   },
   ["skywind3000/asynctasks.vim"] = {
      requires = "skywind3000/asyncrun.vim",
      setup = function()
         vim.cmd "let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg', '.vscode']"

         local map = nvchad.map
         map("n", "<leader>ate", ":AsyncTaskEdit<CR>")
         map("n", "<leader>atl", ":AsyncTaskList<CR>")
         map("n", "<leader>atp", ":AsyncTaskLast<CR>")
         map("n", "<leader>atk", ":AsyncStop<CR>")
      end,
   },
   ["GustavoKatel/telescope-asynctasks.nvim"] = {
      requires = "nvim-telescope/telescope.nvim",
      setup = function()
         local map = nvchad.map
         map("n", "<leader>fat", "<cmd>lua require 'telescope'.extensions.asynctasks.all()<cr>")
      end,
   },

   ["ntpeters/vim-better-whitespace"] = {
      config = function()
         vim.cmd "let g:better_whitespace_enabled=1"
         vim.cmd "let g:strip_whitespace_on_save=1"
         vim.cmd "let g:strip_whitespace_confirm=0"
      end,
   },

   ["natecraddock/workspaces.nvim"] = {
      config = function()
         require("workspaces").setup()
         local map = nvchad.map
         map("n", "<leader>fws", "<cmd>lua require 'telescope'.extensions.workspaces.workspaces()<cr>")
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

   ["tami5/sqlite.lua"] = {},
   ["AckslD/nvim-neoclip.lua"] = {
      requires = {
         { "tami5/sqlite.lua", module = "sqlite" },
         { "nvim-telescope/telescope.nvim" },
      },
      config = function()
         require("custom.plugins.nvim-neoclip").setup()
      end,
   },
   -- {
   --    "wfxr/minimap.vim",
   --    config = function()
   --       vim.cmd "let g:minimap_width = 10"
   --
   --       local map = nvchad.map
   --       map("n", "<leader>mt", ":MinimapToggle<CR>")
   --       map("n", "<leader>mr", ":MinimapRefresh<CR>")
   --       map("n", "<leader>mR", ":MinimapRescan<CR>")
   --    end,
   -- },
   ["voldikss/vim-floaterm"] = {
      config = function()
         local map = nvchad.map
         map("n", "<leader>gl", "<cmd>FloatermNew! --name=lg lazygit<cr>")
         map("n", "<leader>gq", "<cmd>FloatermKill lg<cr>")
         map("t", "<leader>gq", "<c-\\><c-n>:FloatermKill lg<cr>")
         map("n", "<leader>gt", "<cmd>FloatermToggle lg<cr>")
         map("t", "<leader>gt", "<c-\\><c-n>:FloatermToggle lg<cr>")
      end,
   },

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
         require("custom.plugins.diffview").setup()
      end,
   },

   ["xiyaowong/telescope-emoji.nvim"] = {
      requires = "nvim-telescope/telescope.nvim",
      config = function()
         require("telescope").load_extension "emoji"
      end,
   },

   ["ldelossa/litee.nvim"] = {
      config = function()
         require("litee.lib").setup {
            tree = {
               icon_set = "nerd",
            },
            panel = {
               orientation = "bottom",
               panel_size = 30,
            },
         }
      end,
   },
   ["ldelossa/gh.nvim"] = {
      requires = "ldelossa/litee.nvim",
      config = function()
         require("litee.gh").setup {
            -- the icon set to use from litee.nvim.
            -- "nerd", "codicons", "default"
            icon_set = "nerd",
            -- deprecated, around for compatability for now.
            jump_mode = "invoking",
            -- remap the arrow keys to resize any litee.nvim windows.
            map_resize_keys = false,
            -- by default gh.nvim adds the remote of the pull request's HEAD as an
            -- ssh_url. If you do not have ssh keys configured in GitHub this flag will
            -- use the https clone address instead.
            --
            -- be aware, for gh.nvim to work correctly with private repositories, you
            -- should configure ssh keys and use the default settings. gh.nvim will not
            -- prompt for https authentication.
            prefer_https_remote = false,
            -- do not map any keys inside any gh.nvim buffers.
            disable_keymaps = false,
            -- defines keymaps in gh.nvim buffers.
            keymaps = {
               -- used to open a node in a gh.nvim tree
               open = "<CR>",
               -- expand a node in a gh.nvim tree
               expand = "zo",
               -- collapse the node in a gh.nvim tree
               collapse = "zc",
               -- when cursor is ontop of a '#123' formatted issue reference, open a
               -- new tab with the issue details and comments.
               goto_issue = "gd",
               -- show details associated with a node, for example the commit message
               -- for a commit node in the gh.nvim tree.
               details = "d",
            },
         }
      end,
   },
}
