local M = {
  "folke/which-key.nvim",
  commit = "4433e5ec9a507e5097571ed55c02ea9658fb268a",
  event = "VeryLazy",
}

function M.config()
  require("which-key").setup {}
end

return M
