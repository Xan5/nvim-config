local M = {
  "numToStr/Comment.nvim",
  commit = "e30b7f2008e52442154b66f7c519bfd2f1e32acb",
  event = "BufRead",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
      commit = "375c2d86cee6674afd75b4f727ce3a80065552f7",
    },
  },
}

function M.config()
  vim.keymap.set("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
    { silent = true, desc = "Comment line" })
  vim.keymap.set("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    { silent = true, desc = "Comment block" })

  vim.g.skip_ts_context_commentstring_module = true
  require('Comment').setup {
    pre_hook = function()
      return vim.bo.commentstring
    end,
  }
end

return M
