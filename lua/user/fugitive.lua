local M = {
  "tpope/vim-fugitive",
  commit = "d4877e54cef67f5af4f950935b1ade19ed6b7370",
  event = "Bufenter",
}

function M.config()
  vim.keymap.set("n", "<leader>gg", vim.cmd.Git, { desc = "git fugitive" })
end

return M
