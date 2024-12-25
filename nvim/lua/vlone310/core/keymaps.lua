vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Move to previous/next
keymap.set("n", "<C-,>", "<Cmd>BufferPrevious<CR>", opts)
keymap.set("n", "<C-.>", "<Cmd>BufferNext<CR>", opts)

-- Pin/unpin buffer
keymap.set("n", "<C-p>", "<Cmd>BufferPin<CR>", opts)

-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned

-- Close buffer
keymap.set("n", "<C-c>", "<Cmd>BufferClose<CR>", opts)

-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Sort automatically by...
keymap.set("n", "<leader>bn", "<Cmd>BufferOrderByName<CR>", opts)
