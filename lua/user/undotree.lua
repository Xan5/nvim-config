local M = {
  "mbbill/undotree",
  commit = "485f01efde4e22cb1ce547b9e8c9238f36566f21",
  event = "Bufenter",
}

function M.config()
  vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
end

return M