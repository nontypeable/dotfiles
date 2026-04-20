-- Do not continue comments on a new line
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "r", "o" })
    end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
    pattern = "*",
    callback = function(event)
        if event.event == "InsertEnter" then
            vim.opt.relativenumber = false
        else
            vim.opt.relativenumber = true
        end
    end,
})
