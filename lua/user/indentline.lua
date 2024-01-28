local M = {
  "lukas-reineke/indent-blankline.nvim",
  -- commit = "12e92044d313c54c438bd786d11684c88f6f78cd",
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
