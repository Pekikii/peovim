-- init.lua

-- Load general settings
require('settings')

-- Load plugins
require('plugins')

-- Load key mappings
require('mappings')

-- Load LSP configuration
require('lsp')

-- Load obsidian.nvim configuration
require('obsidian_config')

-- Set colorscheme
vim.cmd("colorscheme ir_black")

for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end
