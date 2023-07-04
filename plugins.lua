local plugins = {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        "windwp/nvim-autopairs",
        enabled = false,
    },
    {
        "preservim/tagbar",
        lazy = false,
    },
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require "custom.snippets.luasnip"
            require("luasnip.loaders.from_snipmate").load({paths = "~/.config/nvim/lua/custom/snippets"})
        end,
    },
    {
        "searleser97/cpbooster.vim",
        lazy = false,
    },
}

return plugins
