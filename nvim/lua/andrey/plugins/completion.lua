return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local ok_cmp, cmp = pcall(require, "cmp")
            if not ok_cmp then
                vim.notify("nvim-cmp not found: " .. tostring(cmp), vim.log.levels.ERROR)
                return
            end

            local ok_luasnip, luasnip = pcall(require, "luasnip")
            if not ok_luasnip then
                vim.notify("LuaSnip not found: " .. tostring(luasnip), vim.log.levels.ERROR)
                return
            end

            cmp.setup({
                completion = {
                    autocomplete = false,
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(), -- Open autocomplete menu
                    ["<C-e>"] = cmp.mapping.abort(), -- Close autocomplete menu
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selected options
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Confirm selected options
                    ["<C-k>"] = cmp.mapping.select_prev_item(), -- Move up one option
                    ["<C-j>"] = cmp.mapping.select_next_item(), -- Move down one option
                    ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Move up documentation
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Move down documentation
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                }),
            })
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install",
    },
}
