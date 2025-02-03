vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move sections that have been selected together:
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor at start of line when using J
vim.keymap.set("n", "J", "mzJ`z")
-- Keep cursor in centre of screen when moving page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Allow search terms to stay in centre of screen when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Allows you to paste something from your register (via yanking) by deleting
-- the current line to the void register, so that you still have the original
-- yanked content available for futher pasting
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Use leader y to yank to system keyboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Use leader d to delete to void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Remap Ctl C to ESC (via ThePrimagen)
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Quickfix (and location) navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Highlight a word and this will set up an easy search/replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Toggle to full screen terminal with <leader>t
vim.keymap.set("n", "<leader>t", ":stop<CR>")

-- Easier way to save with <C>s
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>")


-- bindings to run black isort and pylint on python files
vim.keymap.set("n", "<leader>bf", ":!black %<CR>")
vim.keymap.set("n", "<leader>is", ":!isort %<CR>")
vim.keymap.set("n", "<leader>py", ":!pylint %<CR>")
