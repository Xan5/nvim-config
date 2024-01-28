local M = {
  "theprimeagen/harpoon",
  commit = "ccae1b9bec717ae284906b0bf83d720e59d12b91",
  event = "Bufenter",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      commit = "663246936325062427597964d81d30eaa42ab1e4",
      event = "Bufenter",
    }
  },
}


function M.config()
  local mark = require("harpoon.mark")
  local ui = require("harpoon.ui")
  vim.keymap.set("n", "<leader>a", mark.add_file)
  vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

  vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
  vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
  vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
  vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
  vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)
  vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end)
  vim.keymap.set("n", "<leader>7", function() ui.nav_file(7) end)
  vim.keymap.set("n", "<leader>8", function() ui.nav_file(8) end)
  vim.keymap.set("n", "<leader>9", function() ui.nav_file(9) end)
  vim.keymap.set("n", "<leader>0", function() ui.nav_file(0) end)
end

return M
