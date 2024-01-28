local M = {
  "nvim-telescope/telescope.nvim",
  commit = "0902bb39ebaf76e655addc65130eb79b29abe6d2",
  event = "Bufenter",
  cmd = { "Telescope" },
  dependencies = {
    {
      "ahmedkhalf/project.nvim",
      commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb",
    },
  },
}

local actions = require "telescope.actions"
--
-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },
    mappings = {
      i = {
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

function M.config()
  -- Enable telescope fzf native, if installed
  pcall(require('telescope').load_extension, 'fzf')

  -- Telescope live_grep in git root
  -- Function to find the git root directory based on the current buffer's path
  local function find_git_root()
    -- Use the current buffer's path as the starting point for the git search
    local current_file = vim.api.nvim_buf_get_name(0)
    local current_dir
    local cwd = vim.fn.getcwd()
    -- If the buffer is not associated with a file, return nil
    if current_file == '' then
      current_dir = cwd
    else
      -- Extract the directory from the current file's path
      current_dir = vim.fn.fnamemodify(current_file, ':h')
    end

    -- Find the Git root directory from the current file's path
    local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
    if vim.v.shell_error ~= 0 then
      print 'Not a git repository. Searching on current working directory'
      return cwd
    end
    return git_root
  end

  -- Custom live_grep function to search in git root
  local function live_grep_git_root()
    local git_root = find_git_root()
    if git_root then
      require('telescope.builtin').live_grep {
        search_dirs = { git_root },
      }
    end
  end

  vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

  -- See `:help telescope.builtin`
  vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
  vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
  vim.keymap.set('n', '<leader>b/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })

  local function telescope_live_grep_open_files()
    require('telescope.builtin').live_grep {
      grep_open_files = true,
      prompt_title = 'Live Grep in Open Files',
    }
  end
  vim.keymap.set('n', '<leader>f/', telescope_live_grep_open_files, { desc = 'Search / in Open Files' })
  vim.keymap.set('n', '<leader>fs', require('telescope.builtin').builtin, { desc = 'Search Select Telescope' })
  vim.keymap.set('n', '<leader>fg', require('telescope.builtin').git_files, { desc = 'Search Git Files' })
  vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Search Files' })
  vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Search Help' })
  vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = 'Search current Word' })
  vim.keymap.set('n', '<leader>fF', require('telescope.builtin').live_grep, { desc = 'Search by Grep' })
  vim.keymap.set('n', '<leader>fG', ':LiveGrepGitRoot<cr>', { desc = 'Search by Grep on Git Root' })
  vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = 'Search Diagnostics' })
  vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, { desc = 'Search Resume' })


  -- vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
  -- vim.keymap.set("n", "<leader>ft", ":Telescope live_grep<CR>")
  -- vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>")
  -- vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
  -- vim.keymap.set("n", "<leader>vh", ":Telescope help_tags<CR>")
  -- vim.keymap.set("n", "<C-p>", ":Telescope git_files<CR>")
end

return M
