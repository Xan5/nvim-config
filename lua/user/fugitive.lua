local M = {
  "tpope/vim-fugitive",
  commit = "43f18ab9155c853a84ded560c6104e6300ad41da",
  event = "Bufenter",
}

function M.config()
	vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
end

return M