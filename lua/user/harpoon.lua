local M = {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  commit = "0378a6c428a0bed6a2781d459d7943843f374bce",
  event = "Bufenter",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      commit = "ec289423a1693aeae6cd0d503bac2856af74edaa",
      event = "Bufenter",
    }
  },
}


function M.config()
  local harpoon = require("harpoon")
  harpoon:setup()

  vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "add file to quick menu" })
  vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "toggle quick menu" })

  vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "nav file 1" })
  vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "nav file 2" })
  vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "nav file 3" })
  vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "nav file 4" })
  vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "nav file 5" })
  vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end, { desc = "nav file 6" })
  vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end, { desc = "nav file 7" })
  vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end, { desc = "nav file 8" })
  vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end, { desc = "nav file 9" })
  vim.keymap.set("n", "<leader>0", function() harpoon:list():select(0) end, { desc = "nav file 0" })

  -- Toggle previous & next buffers stored within Harpoon list
  vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
  vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
end

return M
