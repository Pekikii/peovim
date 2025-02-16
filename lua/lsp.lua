-- lsp_config.lua

local lspconfig = require('lspconfig')

-- Python
lspconfig.pyright.setup({
    settings = {
        python = {
            formatting = {
                provider = "black", -- Use black as the formatter
            }
        }
    }
})

-- Lua
lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT', -- Specify the Lua version (e.g., LuaJIT for Neovim)
            },
            diagnostics = {
                globals = { 'vim', 'use' }, -- Recognize the 'vim' global variable
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true), -- Make the server aware of Neovim runtime files
            },
            telemetry = {
                enable = false, -- Disable telemetry
            },
        },
    },
}

-- LaTeX
lspconfig.texlab.setup({
    settings = {
        texlab = {
            bibtex = {
                format = 'bibtex',
            },
            diagnostics = {
                enable = true, -- Enable diagnostics for LaTeX files
            },
        },
    },
})

-- Rust
lspconfig.rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy"
            },
            formatting = {
                enable = true
            }
        }
    }
})


-- Mason setup for automatic installation of LSP servers
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { "pyright", "lua_ls" },
})

-- nvim-cmp setup for autocompletion
local cmp = require 'cmp'
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    },
    mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
})


local null_ls = require("null-ls")

-- Configure null-ls for Python formatting
null_ls.setup({
    sources = {
        -- Use black as the formatter
        null_ls.builtins.formatting.black.with({
            extra_args = { "--line-length=120" },
        }),
        null_ls.builtins.formatting.latexindent.with({
            extra_args = { "-l", "120" },
        }),
    },
})
