local M = {
  -- dir = "$HOME/source/tokyonight-night",
  "Xan5/tokyonight.nvim",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

M.name = "tokyonight-night"
function M.config()
local util = require("tokyonight.util")
  require("tokyonight").setup({
    -- use the night style
    style = "night",
    -- disable italic for functions
    styles = {
      functions = {}
    },
    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    on_colors = function(colors)
      util.bg = colors.black
      util.bg_dark = colors.black
    end
  })

  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end
end

return M

