local M = {
  "folke/which-key.nvim",
  commit = "bfec3d6bc0a9b0b2cb11644642f78c2c3915eef0",
  event = "VeryLazy",
}

function M.config()
  require("which-key").setup {}
end

return M
