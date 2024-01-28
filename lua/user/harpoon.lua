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
  vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "add file to quick menu" })
  vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "toggle quick menu" })

  vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "nav file 1" })
  vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = "nav file 2" })
  vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = "nav file 3" })
  vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = "nav file 4" })
  vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end, { desc = "nav file 5" })
  vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end, { desc = "nav file 6" })
  vim.keymap.set("n", "<leader>7", function() ui.nav_file(7) end, { desc = "nav file 7" })
  vim.keymap.set("n", "<leader>8", function() ui.nav_file(8) end, { desc = "nav file 8" })
  vim.keymap.set("n", "<leader>9", function() ui.nav_file(9) end, { desc = "nav file 9" })
  vim.keymap.set("n", "<leader>0", function() ui.nav_file(0) end, { desc = "nav file 0" })
end

return M
