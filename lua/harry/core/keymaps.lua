 vim.g.mapleader = " "

local kmp = vim.keymap

-- general keymaps

kmp.set("i", "jk", "<ESC>") -- Exit INSERT Mode

kmp.set("n", "<leader>nh", ":nohl<CR>") -- Clear Search Highlights

kmp.set("n", "x", '"_x') -- Delete char without copying to register

kmp.set("n", "<leader>sv", "<C-w>v") -- Split window vertically
kmp.set("n", "<leader>sh", "<C-w>s") -- Split window horizontally
kmp.set("n", "<leader>se", "<C-w>=") -- Make split windows equal width
kmp.set("n", "<leader>sx", ":close<CR>") -- Close current split window

kmp.set("n", "<leader>to", ":tabnew<CR>") -- Open new tab
kmp.set("n", "<leader>tx", ":tabclose<CR>") -- Close current tab
kmp.set("n", "<leader>tn", ":tabn<CR>") -- Go to next tab
kmp.set("n", "<leader>tp", ":tabp<CR>") -- Go to prev tab

-- plugin keymaps

kmp.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- Maximize split window

kmp.set("n", "<leader>ps", ":PackerSync<CR>") -- Manual PackerSync since it doesn't wanna do it on its own, the bastard

kmp.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- Nvim-tree

kmp.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>") -- Find files
kmp.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>") -- Find text
kmp.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>") -- Find current string cursor is on
kmp.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>") -- Show active buffers
kmp.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>") -- Show help tags
