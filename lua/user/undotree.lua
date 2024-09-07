local M = {
  "mbbill/undotree",
  commit = "56c684a805fe948936cda0d1b19505b84ad7e065",
  event = "Bufenter",
}

function M.config()
  vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "open undo tree" })
end

return M
