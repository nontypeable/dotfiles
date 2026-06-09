return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",

    config = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "rust",
                "python",
                "c",
                "cpp",
                "go",
                "javascript",
                "typescript",
                "tsx",
                "json",
                "yaml",
                "toml",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "bash",
            },
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,

    init = function()
        require("nvim-treesitter")
            .install({
                "rust",
                "python",
                "c",
                "cpp",
                "go",
                "javascript",
                "typescript",
                "tsx",
                "json",
                "yaml",
                "toml",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "bash",
            })
            :wait(300000)
    end,
}
