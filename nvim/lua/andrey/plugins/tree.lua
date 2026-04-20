return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false,
        config = function()
            vim.g.loaded_netrwPlugin = 0
            require("neo-tree").setup({
                close_if_last_window = true,
                enable_git_status = false,
                window = {
                    position = "right",
                    width = 35,
                },
                filesystem = {
                    follow_current_file = {
                        enabled = true,
                    },
                    hijack_netrw_behavior = "disabled",
                },
                vim.keymap.set("n", "<leader>`", "<cmd>Neotree toggle<CR>"),
            })
        end,
    },
}
