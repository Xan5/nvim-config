local M = {
  "windwp/nvim-autopairs",
  commit = "fd2badc24e675f947162a16c124d395bde80dbd6",
  event = "InsertEnter",
  dependencies = {
    {
      "hrsh7th/nvim-cmp",
      commit = "ae644feb7b67bf1ce4260c231d1d4300b19c6f30",
      event = {
        "InsertEnter",
        "CmdlineEnter",
      },
    },
  },
}

function M.config()
  require("nvim-autopairs").setup {
    check_ts = true, -- treesitter integration
    disable_filetype = { "TelescopePrompt" },
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      java = false,
    },
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- Offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },
  }

  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  local cmp = require "cmp"

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {})
end

return M
