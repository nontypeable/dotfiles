return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
            if not ok_cmp then
                vim.notify("cmp-nvim-lsp not found", vim.log.levels.ERROR)
                return
            end

            local capabilities = cmp_nvim_lsp.default_capabilities()

            local on_attach = function(_, bufnr)
                local opts = { buffer = bufnr, silent = true }

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>f", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)

                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
                vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
            end

            -- Defaults applied to every enabled server
            vim.lsp.config("*", {
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- Rust
            vim.lsp.config("rust_analyzer", {
                root_markers = { "Cargo.toml", ".git" },
                settings = {
                    ["rust-analyzer"] = {
                        diagnostics = { enable = true },
                    },
                },
            })

            -- Python
            vim.lsp.config("pyright", {
                root_markers = {
                    "pyproject.toml",
                    "pyrightconfig.json",
                    "setup.py",
                    "setup.cfg",
                    "requirements.txt",
                    "Pipfile",
                    ".git",
                },
            })

            -- C / C++
            vim.lsp.config("clangd", {
                root_markers = { "compile_commands.json", ".git" },
            })

            -- Go
            vim.lsp.config("gopls", {
                root_markers = { "go.mod", ".git" },
            })

            -- JS / TS
            vim.lsp.config("ts_ls", {
                root_markers = { "package.json", ".git" },
            })

            -- Lua
            vim.lsp.config("lua_ls", {
                root_markers = { ".luarc.json", ".git" },
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            vim.lsp.enable({
                "rust_analyzer",
                "pyright",
                "clangd",
                "gopls",
                "ts_ls",
                "lua_ls",
            })
        end,
    },
}
