return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options={
                icons_enabled = false,
                theme = 'auto',
                section_separators = '',
                component_separators = '',
                globalstatus = true,
                disabled_filetypes = {
                    statusline = { 'neo-tree', 'TelescopePrompt', 'lazy', 'mason' },
                },
            },
            sections = {
                lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
                lualine_b = {'branch'},
                lualine_c = { { 'filename', path = 1, symbols = { modified = '+', readonly = '', unnamed = 'No Name' } } },
                lualine_x = {},
                lualine_y = { { 'diagnostics', sections = { 'error', 'warn', 'hint' } } },
                lualine_z = {'location'}
            },
        })
    end
}
