-- local M = {
--   "bluz71/vim-moonfly-colors",
--   commit = "7f89ca0d2396718078780c802fa18738533a43f1",
--   lazy = false,    -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
-- }
--
-- M.name = "moonfly"
-- function M.config()
--   local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
--   if not status_ok then
--     return
--   end
-- end
--
-- return M

local M = {
  "Xan5/tokyonight.nvim",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

M.name = "tokyonight-night"
function M.config()
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end
end

return M
