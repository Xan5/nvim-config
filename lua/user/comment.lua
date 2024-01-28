local M = {
  "numToStr/Comment.nvim",
  commit = "0236521ea582747b58869cb72f70ccfa967d2e89",
  event = "BufRead",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
      commit = "1277b4a1f451b0f18c0790e1a7f12e1e5fdebfee",
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
