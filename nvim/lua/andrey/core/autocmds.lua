local augroup = vim.api.nvim_create_augroup("Andrey", { clear = true })

-- Do not continue comments on a new line
vim.api.nvim_create_autocmd("FileType", {
    group = augroup,
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "r", "o" })
    end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
    group = augroup,
    pattern = "*",
    callback = function(event)
        if event.event == "InsertEnter" then
            vim.wo.relativenumber = false
        else
            vim.wo.relativenumber = true
        end
    end,
})
