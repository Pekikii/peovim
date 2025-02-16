-- plugins.lua

-- Ensure packer is installed
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    Packer_Bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
end

require("packer").startup(function()
    -- Packer itself (must be the first plugin to be loaded)
    use "wbthomason/packer.nvim"

    -- nvim-lspconfig: Set up language servers
    use "neovim/nvim-lspconfig"

    -- nvim-cmp: Autocompletion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"

    -- mason.nvim: Install language servers and other tools
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    -- vim-surround: For working with parentheses, quotes, etc.
    use "tpope/vim-surround"

    -- vim-commentary: For commenting out code
    use "tpope/vim-commentary"

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        "pekikii/apm.nvim",
        config = function()
            require('apm').setup()
        end,
    }

    use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }

    use {
        'kelly-lin/ranger.nvim',
        config = function()
            require('ranger-nvim').setup({ replace_netrw = true })

            vim.api.nvim_set_keymap('n', 'fs', '', {
                noremap = true,
                silent = true,
                callback = function()
                    require('ranger-nvim').open(true)
                end,
            })
        end
    }

    use({
        "epwalsh/obsidian.nvim",
        tag = "*",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })

    if Packer_Bootstrap then
        require("packer").sync()
    end
end)
