-- ~/.config/nvim/lua/myconfig/plugins.lua
return {
    { "nvim-lua/plenary.nvim" }, -- dependency
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require('telescope').setup {
                defaults = {
                    file_ignore_patterns = { "node_modules", ".git" },
                }
            }
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({
                filters = {
                    dotfiles = false,
                },
                git = {
                    enable = true,
                    ignore = false,
                },
                on_attach = function(bufnr)
                    local api = require("nvim-tree.api")

                    -- ✅ This loads all default keybindings, including `y`, `x`, `p`
                    api.config.mappings.default_on_attach(bufnr)

                    -- ✅ You can still override specific ones here if you want
                    vim.keymap.set('n', '<Tab>', '<C-w>w', { buffer = bufnr })
                end,
            })
        end,
    },

    { "nvim-tree/nvim-web-devicons" },
    { "folke/tokyonight.nvim" },

    {
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettier,
                },
            })
        end,
        lazy = false,
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = { "saghen/blink.cmp" }
    },

    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
        lazy = false
    },

    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = '1.*',
        opts = {
            keymap = { preset = 'super-tab' },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },
            signature = { enabled = true }
        },
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
        end
    }

}
