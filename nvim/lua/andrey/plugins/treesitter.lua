return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "rust",
                "python",
                "c",
                "cpp",
                "go",
                "javascript",
                "typescript",
                "tsx",
                "json",
                "jsonc",
                "yaml",
                "toml",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "bash",
            },
            sync_install = true,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = false },
        })
    end,
}
