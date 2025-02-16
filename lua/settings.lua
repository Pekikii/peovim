-- settings.lua

-- General settings for Neovim

-- Disable compatibility mode, allowing full access to Neovim features
vim.opt.compatible = false

-- Set encoding to UTF-8
vim.opt.encoding = "utf-8"

-- Enable filetype detection, plugin loading, and indentation
vim.cmd("filetype plugin indent on")

-- General design and other settings

-- Show line numbers in the editor
vim.opt.number = true

-- Disable swap files, reducing file system clutter
vim.opt.swapfile = false

-- Set tab size to 4 spaces
vim.opt.tabstop = 4

-- Set shift width to 4 spaces for auto-indentation
vim.opt.shiftwidth = 4

-- Replace tabs with spaces
vim.opt.expandtab = true

-- Ignore case when searching
vim.opt.ignorecase = true

-- Incremental search: shows matches as you type
vim.opt.incsearch = true

-- Highlight all search matches in the document
vim.opt.hlsearch = true

-- Use the system clipboard for yank, delete, change, and put operations
vim.opt.clipboard = "unnamedplus"

-- Enable wildmenu for enhanced command-line completion
vim.opt.wildmenu = true

-- Set wildmode to display a list of longest matches
vim.opt.wildmode = "list:longest"

-- Ignore specific file types in wildmenu (e.g., images, PDFs, etc.)
vim.opt.wildignore = { "*.docx", "*.jpg", "*.png", "*.gif", "*.pdf", "*.pyc", "*.exe", "*.flv", "*.img", "*.xlsx" }

-- Disable error bells for a more seamless experience
vim.opt.errorbells = false

-- Enable visual bell (flashes screen instead of making noise)
vim.opt.visualbell = true

-- Keep buffers open when switching between them
vim.opt.hidden = true

-- Enable syntax highlighting
vim.opt.syntax = "on"

-- Set 'conceallevel' to 1 to hide syntax (e.g., Markdown) for cleaner visuals while preserving layout.
vim.opt.cursorline = true

vim.opt.conceallevel = 1


-- Remove 'r', and 'o' flags from formatoptions
-- 'r' : Prevents automatic insertion of comment leaders when pressing Enter within a comment.
-- 'o' : Prevents automatic insertion of comment leaders when pressing 'o' or 'O' in Normal mode within a comment.
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ 'r', 'o' })
    end,
})

vim.o.statusline = "%#StatusLine# " ..
    "%f " ..

    "%=" ..

    "%l:%c " ..
    "/%L " ..
    "%{wordcount().words} "
