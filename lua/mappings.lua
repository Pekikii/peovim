-- mappings.lua

-- Set the leader key to single quote (')
vim.g.mapleader = "'"
-- Disable jump to mark (')
vim.api.nvim_set_keymap('n', "'", "<Nop>", { noremap = true, silent = true })

-- Disable Shift + Q
vim.keymap.set("n", "<S-Q>", "<Nop>")

-- Window Navigation
-- Use Ctrl + H/J/K/L to move between splits
vim.keymap.set("n", "<C-H>", "<C-W>h") -- Move to the split on the left
vim.keymap.set("n", "<C-J>", "<C-W>j") -- Move to the split below
vim.keymap.set("n", "<C-K>", "<C-W>k") -- Move to the split above
vim.keymap.set("n", "<C-L>", "<C-W>l") -- Move to the split on the right

-- Resize splits with Ctrl + arrow keys
vim.keymap.set("n", "<C-Up>", "<C-W>+")    -- Increase the height of the current split
vim.keymap.set("n", "<C-Down>", "<C-W>-")  -- Decrease the height of the current split
vim.keymap.set("n", "<C-Left>", "<C-W><")  -- Decrease the width of the current split
vim.keymap.set("n", "<C-Right>", "<C-W>>") -- Increase the width of the current split

-- Miscellaneous Mappings
-- Clear search highlights with Ctrl + Z
vim.keymap.set("n", "<C-z>", ":let @/=''<CR>")                      -- Clear the current search highlight
-- Yank (copy) to the end of the line with "Y"
vim.keymap.set("n", "Y", "y$")                                      -- Yank from cursor to end of the line
-- Create a new line below with Ctrl + O
vim.keymap.set("n", "<C-o>", "o<esc>")                              -- Insert a new line below and exit insert mode
-- Replace selected text with Ctrl + R (using the selected text in a substitution)
vim.keymap.set("v", "<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>') -- Replace selected text interactively

-- Fold management with zf and zo (creating and opening folds), and save views after
vim.keymap.set("n", "zf", ":normal! zf<CR>:mkview<CR>") -- Create a fold and save the view
vim.keymap.set("n", "zo", ":normal! zo<CR>:mkview<CR>") -- Open a fold and save the view

-- Keep the cursor centered when scrolling or searching
vim.keymap.set("n", "<C-D>", "<C-D>zz") -- Scroll down, centering cursor
vim.keymap.set("n", "<C-U>", "<C-U>zz") -- Scroll up, centering cursor
vim.keymap.set("n", "n", "nzz")         -- Next search result, centering the cursor
vim.keymap.set("n", "N", "Nzz")         -- Previous search result, centering the cursor

-- Make sure to paste without affecting the clipboard (for replacing selected text)
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Format code using the LSP formatter
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("v", '<leader>f', vim.lsp.buf.format)

-- Delete the current line(s) without affecting the clipboard (for deletion in visual mode)
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d") -- Delete text without copying it

-- Run 'make' with <leader>m
vim.keymap.set("n", "<leader>m", ":!make<CR>")

_G.open_todo_workspace = function()
    vim.cmd('vsplit')
    vim.cmd('ObsidianWorkspace todo')
    vim.cmd('ObsidianToday')
    vim.cmd('sleep 100m')
    if vim.fn.getline(7) ~= "  - todo" then
        vim.fn.append(6, "  - todo")
    end
    vim.cmd('normal! G')
end

_G.open_til_workspace = function()
    vim.cmd('vsplit')
    vim.cmd('ObsidianWorkspace til')
    vim.cmd('ObsidianToday')
    vim.cmd('sleep 100m')
    vim.cmd('normal! G')
end

_G.search_todos = function()
    vim.cmd('ObsidianWorkspace todo')
    vim.cmd('ObsidianTags todo')
    vim.defer_fn(function()
        vim.cmd('stopinsert') -- Exit insert mode after a short delay
    end, 200)             -- Adjust delay if necessary
end

vim.api.nvim_set_keymap('n', '<leader>td', ':lua open_todo_workspace()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ti', ':lua open_til_workspace()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>to', ":lua search_todos()<CR>", { noremap = true, silent = true })
