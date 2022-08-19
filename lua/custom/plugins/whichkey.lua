local wk = require "which-key"
local M = {}

local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function M.custom()
  wk.register({
    ["bd"] = { "<cmd>bd!<cr>", "close buffer" },
    ["qq"] = { "<cmd>%bdelete! | wqa<cr>", "quit all" },
    ["ct"] = { "<cmd>checktime<cr>", "refresh buffer" },
    ["nl"] = { ":noh<cr>", "remove search highlight" },
    ["ps"] = { "<cmd>PackerSync<cr>", "Sync packer installs" },
    ["pc"] = { "<cmd>PackerCompile<cr>", "Compile packer plugins" },
    ["pp"] = { ":Glow<CR>", " Glow preview markdown" },

    ["q"] = {},

    ["fm"] = {
      function()
        local vim_version = vim.version()

        if vim_version.minor > 7 then
          -- nightly
          vim.lsp.buf.format {}
        else
          -- stable
          vim.lsp.buf.formatting_sync { async = true }
        end
      end,
      "lsp formatting",
    },

    a = {
      t = {
        name = "+Asynctasks",
        e = { ":AsyncTaskEdit<CR>", "Edit async tasks" },
        l = { ":AsyncTaskList<CR>", "Show async tasks" },
        p = { ":AsyncTaskLast<CR>", "Run last runed async task" },
        k = { ":AsyncStop<CR>", "Stop current async task" },
      },
    },

    C = {
      name = "+Crates",
      t = {
        function()
          require("crates").toggle()
        end,
        "Toggle information",
      },
      r = {
        function()
          require("crates").reload()
        end,
        "Reload information",
      },
      u = {
        function()
          require("crates").upgrade_crate()
        end,
        "Upgrade crate",
      },
      U = {
        function()
          require("crates").upgrade_crates()
        end,
        "Upgrade selected crates",
      },
      A = {
        function()
          require("crates").upgrade_all_crates()
        end,
        "Upgrade all crates",
      },
    },

    f = {
      name = "+Telescope",
      f = { "<cmd> Telescope find_files <CR>", "find files" },
      a = {
        "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
        "find all",
      },
      A = {
        function()
          require("telescope").extensions.asynctasks.all()
        end,
        "find async task",
      },
      t = { "<cmd> Telescope live_grep <CR>", "live grep" },
      T = {
        function()
          require("telescope").extensions.terms.terms()
        end,
        "pick hidden term",
      },
      W = {
        function()
          require("telescope").extensions.workspaces.workspaces()
        end,
        "find workspace",
      },
      l = { "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>", "find workspace symbols" },
      b = { "<cmd> Telescope buffers <CR>", "find buffers" },
      h = { "<cmd> Telescope help_tags <CR>", "help page" },
      o = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
      k = { "<cmd> Telescope keymaps <CR>", "show keys" },
      w = { "<cmd> Telescope grep_string <CR>", "find word" },

      g = {
        name = "+Git",
        c = { "<cmd> Telescope git_commits <CR>", "git commits" },
        g = { "<cmd> Telescope git_status <CR>", "git status" },
      },

      v = {
        function()
          require("telescope").extensions.themes.themes()
        end,
        "nvchad themes",
      },

      p = {
        function()
          require("telescope").extensions.file_browser.file_browser()
        end,
        "file browser",
      },

      P = {
        function()
          require("telescope").extensions.neoclip.neoclip()
        end,
        "find clipboard",
      },

      q = {
        function()
          require("telescope").extensions.flutter.commands()
        end,
        "find flutter command",
      },

      d = {
        name = "+Dap",
        l = { ":Telescope dap commands<CR>", "find debugger command" },
        c = { ":Telescope dap configurations<CR>", "find debugger configuration" },
        b = { ":Telescope dap list_breakpoints<CR>", "find debugger breakpoint" },
        v = { ":Telescope dap variables<CR>", "find debugger variable" },
        f = { ":Telescope dap frames<CR>", "find debugger frame" },
      },

      ["/"] = { ":TodoTelescope<CR>", "file todo" },
    },

    g = {
      name = "+Git",
      l = {
        function()
          local terms = require("nvterm.terminal").list_active_terms()
          local has_float_term = false
          for _, t in ipairs(terms) do
            if t.type == "float" and t.open then
              has_float_term = pcall(function()
                vim.cmd("bd! " .. tostring(t.buf))
              end)
            end
          end

          if not has_float_term then
            require("nvterm.terminal").toggle "float"
            require("nvterm.terminal").send("lazygit", "float")
          end
        end,
        "open lazygit",
      },
      m = {
        ":GitMessenger<cr>",
        " open GitMessenger",
      },
    },

    i = {
      name = "+Impatient",
      c = {
        "<cmd>LuaCacheClear<cr>",
        "Clear Impatient cache",
      },
      l = {
        "<cmd>LuaCacheLog<cr>",
        "View Impatient log",
      },
    },

    l = {
      name = "+LSP",
      f = {
        function()
          require("lspsaga.provider").lsp_finder()
        end,
        "lsp saga find",
      },
      a = {
        function()
          require("lspsaga.codeaction").code_action()
        end,
        "lsp saga code action",
      },
      d = {
        function()
          require("lspsaga.hover").render_hover_doc()
        end,
        "lsp saga doc",
      },
      s = {
        function()
          require("lspsaga.signaturehelp").signature_help()
        end,
        "lsp saga signature help",
      },
      r = {
        function()
          require("lspsaga.rename").rename()
        end,
        "lsp saga rename",
      },
      p = {
        function()
          require("lspsaga.provider").preview_definition()
        end,
        "lsp saga preview definition",
      },
      k = {
        function()
          vim.diagnostic.open_float()
        end,
        "floating diagnostic",
      },
    },

    o = {
      name = "+Octo",
      d = { "<cmd>Octo review discard<cr>", " Octo review discard" },
      m = { "<cmd>Octo pr merge rebase<cr>", "Octo pr merge rebase" },
      i = { "<cmd>Octo review start<cr>", "Octo review start" },
      s = { "<cmd>Octo review submit<cr>", "Octo review submit" },
      a = { "<cmd>Octo review resume<cr>", "Octo review resume" },
      x = { "<cmd>Octo review close<cr>", "Octo review close" },
      p = { "<cmd>Octo pr list<cr>", "Octo pr list" },
      c = { "<cmd>Octo review commit<cr>", "Octo review commits list" },
    },

    r = {
      name = "+Repl",
      a = { "<Plug>JupyterExecuteAll", "execute all jupyter cells" },
      c = { "<Plug>(IPy-RunCell)", "run ipy cell" },
      k = { ":IPython --existing --no-window<CR>", "connect opened ipython kernel" },
      l = { "<Plug>(iron-send-line)", "send line to repl" },
      r = { "<Plug>(IPy-Run)", "run ipy" },
      x = { "<Plug>JupyterExecute", "execute single jupyter cell" },
      ["qt"] = { ":RunQtConsole<CR>", "run qtconsole" },
    },

    s = {
      name = "+Search",
      s = {
        function()
          require("searchbox").incsearch()
        end,
        "search in file",
      },
      r = {
        function()
          require("searchbox").replace { confirm = "menu" }
        end,
        "search and replace in file",
      },
    },

    t = {
      name = "+Terminal",
      w = {
        function()
          require("nvterm.terminal").toggle "float"
        end,
        "toggle float nvterm",
      },
      W = {
        function()
          require("nvterm.terminal").new "float"
        end,
        "spawn float nvterm",
      },
      h = {
        function()
          require("nvterm.terminal").toggle "horizontal"
        end,
        "toggle horizontal nvterm",
      },
      H = {
        function()
          require("nvterm.terminal").new "horizontal"
        end,
        "spawn horizontal nvterm",
      },
      v = {
        function()
          require("nvterm.terminal").toggle "vertical"
        end,
        "toggle vertical nvterm",
      },
      V = {
        function()
          require("nvterm.terminal").new "vertical"
        end,
        "spawm vertical nvterm",
      },
    },

    v = {
      name = "+Window",
      ["<"] = { "<C-w><", "window resize left" },
      [">"] = { "<C-w>>", "window resize right" },
      ["-"] = { "<C-w>-", "window resize small" },
      ["+"] = { "<C-w>+", "window resize large" },
      ["="] = { "<C-w>=", "window reset size" },
      s = { "<cmd>split<cr>", "split window vertical" },
      v = { "<cmd>vsplit<cr>", "split window horizontal" },
      d = { "<cmd>close<cr>", "close window" },
    },

    x = {
      name = "+Trouble",
      x = { "<cmd>Trouble<cr>", "Open Trouble window" },
      w = { "<cmd>Trouble workspace_diagnostics<cr>", "Open Trouble workspace diagnostics" },
      d = { "<cmd>Trouble document_diagnostics<cr>", "Open Trouble document diagnostics" },
      l = { "<cmd>Trouble loclist<cr>", "Open Trouble loclist" },
      q = { "<cmd>Trouble quickfix<cr>", "Open Trouble quickfix" },
      t = { ":TodoTrouble<CR>", "Open todos in trouble" },
    },

    z = {
      name = "+Debugger",
      b = {
        function()
          require("dap").toggle_breakpoint()
        end,
        "debugger toggle breakpoint",
      },
      c = {
        function()
          require("dap").continue()
        end,
        "debugger continue",
      },
      o = {
        function()
          require("dap").step_over()
        end,
        "debugger step over",
      },
      i = {
        function()
          require("dap").step_into()
        end,
        "debugger step into",
      },
      r = {
        function()
          require("dap").repl.open()
        end,
        "debugger repl open",
      },
      n = {
        function()
          require("dapui").toggle "sidebar"
        end,
        "debugger toggle sidebar",
      },
      k = {
        function()
          require("dapui").eval()
        end,
        "debugger eval",
      },
      l = { ":10sp | buffer \\[dap-repl]<cr>", "focus debugger repl buffer" },
    },
  }, { prefix = "<leader>", mode = "n" })

  wk.register({
    k = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "lsp signature_help",
    },

    r = {
      function()
        require("telescope.builtin").lsp_references()
      end,
      "lsp references",
    },

    t = {
      name = "+Treesitter",
      v = {
        function()
          require("syntax-tree-surfer").targeted_jump { "variable_declaration" }
        end,
        " Go to Variables",
      },
      f = {
        function()
          require("syntax-tree-surfer").targeted_jump { "function" }
        end,
        "Go to Functions",
      },
      i = {
        function()
          require("syntax-tree-surfer").targeted_jump {
            "if_statement",
            "else_clause",
            "else_statement",
            "elseif_statement",
          }
        end,
        "Go to If Statements",
      },
      r = {
        function()
          require("syntax-tree-surfer").targeted_jump { "for_statement" }
        end,
        "Go to For Statements",
      },
      w = {
        function()
          require("syntax-tree-surfer").targeted_jump { "white_statement" }
        end,
        "Go to While Statements",
      },
      s = {
        function()
          require("syntax-tree-surfer").targeted_jump { "switch_statement" }
        end,
        "Go to Switch Statements",
      },
      t = {
        function()
          require("syntax-tree-surfer").targeted_jump {
            "function",
            "if_statement",
            "else_clause",
            "else_statement",
            "elseif_statement",
            "for_statement",
            "while_statement",
            "switch_statement",
          }
        end,
        "Go to Statement",
      },
    },
  }, { prefix = "g", mode = "n" })

  wk.register({
    h = { "<cmd>tabfirst<cr>", "switch to first tab" },
    k = { "<cmd>tabnext<cr>", "switch to next tab" },
    j = { "<cmd>tabprev<cr>", "switch to previous tab" },
    l = { "<cmd>tablast<cr>", "switch to last tab" },
  }, { prefix = "<C-t>", mode = "n" })

  wk.register({
    ["<C-e>"] = { termcodes "<C-\\><C-N>", "escape terminal mode" },
  }, { mode = "t" })
end

return M
