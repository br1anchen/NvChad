local M = {}

function M.packer_lazy_load(plugin, time)
  vim.defer_fn(function()
    require("packer").loader(plugin)
  end, time or 0)
end

return M
