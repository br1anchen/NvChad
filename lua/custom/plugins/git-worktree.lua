local ok, git_worktree = pcall(require, "git-worktree")
local Job = require "plenary.job"
local luv = vim.loop

if not ok then
  return
end

local function exists(filename)
  local stat = luv.fs_stat(filename)
  return stat and stat.type or false
end

local function is_melos_project()
  return exists "melos.yaml"
end

local M = {}

M.setup = function()
  git_worktree.on_tree_change(function(op, metadata)
    if (op == git_worktree.Operations.Create or op == git_worktree.Operations.Switch) and is_melos_project() then
      print 'Melos project detected, running "melos bs"'
      local melos_bs_job = Job:new {
        command = "melos",
        args = { "bs" },
        cwd = metadata.path,
      }

      melos_bs_job:after_success(vim.schedule_wrap(function()
        print "Melos bootstrap success"
      end))

      melos_bs_job:after_failure(vim.schedule_wrap(function(j)
        print("Melos bootstrap failed: " .. j:stderr_result())
      end))

      melos_bs_job:start()
    end
  end)
end

return M
