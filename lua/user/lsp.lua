local M = {
  "neovim/nvim-lspconfig",
  commit = "8917d2c830e04bf944a699b8c41f097621283828",
  dependencies = {
    {
      "williamboman/mason.nvim",
      config = true,
      commit = "dcd0ea30ccfc7d47e879878d1270d6847a519181",
    },
    {
      "williamboman/mason-lspconfig.nvim",
      commit = "b9084b1f42f790d6230dc66dbcb6bcc35b148552",
    },

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require("fidget").setup({})`
    {
      "j-hui/fidget.nvim",
      opts = {},
      commit = "1d1042d418ee8cb70d68f1e38db639844331c093",
    },

    -- Additional lua configuration, makes nvim stuff amazing!
    {
      "folke/neodev.nvim",
      commit = "64b2a51b02c6f2ae177c745e4d8bc801a339fe09",
    },

    {
      "hrsh7th/cmp-nvim-lsp",
      commit = "5af77f54de1b16c34b23cba810150689a3a90312",
    },
    {
      "simrat39/rust-tools.nvim",
      commit = "676187908a1ce35ffcd727c654ed68d851299d3e",
    },
    {
      "ziglang/zig.vim",
      commit = "54c216e5306a5c3878a60596aacb94dca8652ab9",
    },
  },
}

-- local cmp_nvim_lsp = require "cmp_nvim_lsp"
function M.config()
  -- [[ Configure LSP ]]
  --  This function gets run when an LSP connects to a particular buffer.
  local on_attach = function(_, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don"t have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(modes, keys, func, desc)
      if desc then
        desc = "LSP: " .. desc
      end

      vim.keymap.set(modes, keys, func, { buffer = bufnr, desc = desc })
    end

    nmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
    nmap("n", "<leader>lr", vim.lsp.buf.rename, "Rename")
    nmap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
    nmap({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, "Code Action")

    nmap("n", "gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
    -- nmap("n", "gd", vim.lsp.buf.definition(), "Goto Definition")
    nmap("n", "gr", require("telescope.builtin").lsp_references, "Goto References")
    -- nmap("n", "gr", vim.lsp.buf.references(), "Goto References")
    nmap("n", "gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
    -- nmap("n", "gI", vim.lsp.buf.implementation(), "Goto Implementation")
    nmap("n", "<leader>D", require("telescope.builtin").lsp_type_definitions, "Type Definition")
    nmap("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
    nmap("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")

    -- See `:help K` for why this keymap
    nmap("n", "K", vim.lsp.buf.hover, "Hover Documentation")
    nmap("n", "<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
    -- nmap("n", "<leader>ls", vim.lsp.buf.signature_help, "Signature help")
    nmap("n", "<leader>lq", vim.diagnostic.setloclist, "Set loc list")

    -- Lesser used LSP functionality
    nmap("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
    nmap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Workspace Add Folder")
    nmap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Workspace Remove Folder")
    nmap("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "Workspace List Folders")


    nmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostics open float")
    nmap("n", "<leader>li", "<cmd>LspInfo<cr>")
    nmap("n", "<leader>lI", "<cmd>Mason<cr>")
    nmap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", "Diagnostics down")
    nmap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>", "Diagnostics up")
    nmap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "Format buffer")


    -- Create a command `:Format` local to the LSP buffer
    -- vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    --   vim.lsp.buf.format()
    -- end, { desc = "Format current buffer with LSP" })
  end

  -- mason-lspconfig requires that these setup functions are called in this order
  -- before setting up the servers.
  require("mason").setup()
  require("mason-lspconfig").setup()

  -- Enable the following language servers
  --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
  --
  --  Add any additional override configuration in the following tables. They will be passed to
  --  the `settings` field of the server config. You must look up that documentation yourself.
  --
  --  If you want to override the default filetypes that your language server will attach to you can
  --  define the property "filetypes" to the map in question.
  local servers = {
    -- clangd = {},
    -- gopls = {},
    -- pyright = {},
    rust_analyzer = {},
    zls = {},
    -- tsserver = {},
    -- html = { filetypes = { "html", "twig", "hbs"} },

    lua_ls = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        -- NOTE: toggle below to ignore Lua_LS"s noisy `missing-fields` warnings
        -- diagnostics = { disable = { "missing-fields" } },
      },
    },
  }

  -- Setup neovim lua configuration
  require("neodev").setup()

  -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

  -- Ensure the servers above are installed
  local mason_lspconfig = require "mason-lspconfig"

  mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
  }

  mason_lspconfig.setup_handlers {
    function(server_name)
      Opts = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      if server_name == "zls" then
        local lspconfig = require("lspconfig")
        local on_attach_zls = function(_, bufnr)
          vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
          require("completion").on_attach()
        end
        lspconfig.zls.setup {
          on_attach = on_attach_zls,
        }
      end

      if server_name == "rust_analyzer" then
        local rt = require "rust-tools"
        rt.setup {
          tools = {
            on_initialized = function()
              vim.cmd [[
              autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
            ]]
            end,
          },
          server = {
            on_attach = function(client, bufnr)
              on_attach(client, bufnr)
              vim.keymap.set({ "n", "v" }, "<leader>K", rt.hover_actions.hover_actions, { buffer = bufnr })
              vim.keymap.set({ "n", "v" }, "<leader>A", rt.code_action_group.code_action_group, { buffer = bufnr })
            end,
            capabilities = capabilities,
            settings = {
              ["rust-analyzer"] = {
                lens = {
                  enable = true,
                },
                checkOnSave = {
                  command = "clippy",
                },
              },
            },
          },
        }
      end

      require("lspconfig")[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = servers[server_name],
        filetypes = (servers[server_name] or {}).filetypes,
      }
    end,
  }
end

return M
