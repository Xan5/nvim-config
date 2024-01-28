local M = {
  "tpope/vim-fugitive",
  commit = "854a8df0d06b8d3fcb30fa7f2b08c62b553eee3b",
  event = "Bufenter",
}

function M.config()
	vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
end

return M
