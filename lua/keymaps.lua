-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)

-- Better paste
keymap("v", "p", 'P', opts)

-- Insert --
-- Press jk fast to exit 
keymap("i", "jk", "<ESC>", opts)
-- Prest <C-c> to exit
keymap("i", "<C-c>", "<Esc>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- go to Visual block mode 
-- keymap({ "n", "v" }, "<C-q>", "<C-q>",opts)

-----

-- Explorer
keymap("n", "<leader>pv", vim.cmd.Ex)

-- move vlock line up/down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- add/substract remap
keymap({ "n", "v", "x" }, "<F1>", "<C-a>", opts)
keymap({ "n", "v", "x" }, "<F2>", "<C-x>", opts)

-- Ctrl + a
keymap({ "n", "v" }, "<C-a>", "ggVG", opts)

-- Ctrl + s
keymap({ "n", "v" }, "<C-s>", "<cmd>:w<CR>", opts)
keymap({ "i" }, "<C-s>", "<Esc><cmd>:w<CR>", opts)

keymap({ "n" }, "J", "mzJ`z", opts)

-- half screen move
keymap({ "n", "v", "x" }, "<C-x>", "<C-d>zz", opts)
keymap({ "n", "v", "x" }, "<C-z>", "<C-u>zz", opts)

-- replace regex
keymap("n", "<leader>s", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap("n", "<leader>@", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap({"v","x"}, "<leader>s", [[:s/\%V<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Close buffer without closing split
keymap("n", "<leader>w", "<cmd>bp|bd #<CR>", { desc = "Close Buffer; Retain Split" })

-- Navigate between quickfix items
keymap("n", "]q", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" })
keymap("n", "[q", "<cmd>cprev<CR>zz", { desc = "Backward qfixlist" })

-- Navigate between location list items
keymap("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Forward location list" })
keymap("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Backward location list" })

-- next/previous searched item
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- keymap({"n", "o", "x"}, "<s-h>", "^", { desc = "Jump to beginning of line" })
-- keymap({"n", "o", "x"}, "<s-l>", "g_", { desc = "Jump to end of line" })

-- Search for highlighted text in buffer
keymap("v", "//", 'y/<C-R>"<CR>', { desc = "Search for highlighted text" })

-- Exit terminal mode shortcut
keymap("t", "<C-t>", "<C-\\><C-n>")

-- Make Y behave like C or D
keymap("n", "Y", "y$")

-- Select all
keymap("n", "==", "gg<S-v>G")

-- -- Copy text to " register
-- keymap("n", "<leader>y", "\"+y", { desc = "Yank into \" register" })
-- keymap("v", "<leader>y", "\"+y", { desc = "Yank into \" register" })
-- keymap("n", "<leader>Y", "\"+Y", { desc = "Yank into \" register" })
--
-- -- Delete text to " register
-- keymap("n", "<leader>d", "\"_d", { desc = "Delete into \" register" })
-- keymap("v", "<leader>d", "\"_d", { desc = "Delete into \" register" })

-- Paste without overwriting register
keymap({ "v" , "x" }, "<leader>p", [["_dP]], opts)

-- next greatest remap ever : asbjornHaland
keymap({ "n", "v" }, "<leader>y", [["+y]], opts)
keymap("n", "<leader>Y", [["+Y]], opts)

keymap({ "n", "v" }, "<leader>d", [["_d]], opst)

-- Remap for dealing with word wrap
-- keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
keymap('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

