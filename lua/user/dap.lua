local M = {
  "mfussenegger/nvim-dap",
  commit = "9adbfdca13afbe646d09a8d7a86d5d031fb9c5a5",
  event = "VeryLazy",
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    {
      "rcarriga/nvim-dap-ui",
      commit = "d845ebd798ad1cf30aa4abd4c4eff795cdcfdd4f",
    },

    -- Installs the debug adapters for you
    {
      "williamboman/mason.nvim",
      commit = "751b1fcbf3d3b783fcf8d48865264a9bcd8f9b10",
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      commit = "3614a39aae98ccd34124b072939d6283853b3dd2",
    },

    -- Add your own debuggers here
    -- {
    --   "leoluz/nvim-dap-go",
    --   commit = "a5cc8dcad43f0732585d4793deb02a25c4afb766",
    -- },
  }
}

function M.config()
  local dap = require "dap"
  local dapui = require "dapui"

  require("mason-nvim-dap").setup {
    -- Makes a best effort to setup the various debuggers with
    -- reasonable debug configurations
    automatic_setup = true,

    -- You can provide additional configuration to the handlers,
    -- see mason-nvim-dap README for more information
    handlers = {},

    -- You"ll need to check that you have the required things installed
    -- online, please don"t ask me how to install them :)
    ensure_installed = {
      -- Update this to ensure that you have the debuggers for the langs you want
      -- "delve",
    },
  }

  -- Basic debugging keymaps, feel free to change to your liking!
  vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
  vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
  vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
  vim.keymap.set("n", "<F9>", dap.step_out, { desc = "Debug: Step Out" })
  vim.keymap.set("n", "<F12>", dap.terminate, { desc = "Debug: Terminate" })
  vim.keymap.set("n", "<F6>", dap.run_last, { desc = "Debug: Run Last" })
  vim.keymap.set("n", "<F8>", dap.repl.toggle, { desc = "Debug: Reply Toggle" })
  vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
  vim.keymap.set("n", "<leader>B", function()
    dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
  end, { desc = "Debug: Set Breakpoint" })

  -- Dap UI setup
  -- For more information, see |:help nvim-dap-ui|
  dapui.setup {
    -- Set icons to characters that are more likely to work in every terminal.
    --    Feel free to remove or use ones that you like more! :)
    --    Don"t feel like these are good choices.
    icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
    controls = {
      icons = {
        pause = "⏸",
        play = "▶",
        step_into = "⏎",
        step_over = "⏭",
        step_out = "⏮",
        step_back = "b",
        run_last = "▶▶",
        terminate = "⏹",
        disconnect = "⏏",
      },
    },
  }

  -- Toggle to see last session result. Without this, you can"t see session output in case of unhandled exception.
  vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })

  dap.listeners.after.event_initialized["dapui_config"] = dapui.open
  dap.listeners.before.event_terminated["dapui_config"] = dapui.close
  dap.listeners.before.event_exited["dapui_config"] = dapui.close

  -- Install golang specific config
  -- require("dap-go").setup()
end

return M
