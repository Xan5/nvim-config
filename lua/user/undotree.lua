local M = {
  "mbbill/undotree",
  commit = "36ff7abb6b60980338344982ad4cdf03f7961ecd",
  event = "Bufenter",
}

function M.config()
  vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "open undo tree" })
end

return M
