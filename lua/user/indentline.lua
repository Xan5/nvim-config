local M = {
  "lukas-reineke/indent-blankline.nvim",
  commit = "18603eb949eba08300799f64027af11ef922283f",
  event = "BufReadPre",
  main = "ibl",
}

function M.config()
  require("ibl").setup(
    {
      indent = { char = "│"},
    }
  )
end

return M
