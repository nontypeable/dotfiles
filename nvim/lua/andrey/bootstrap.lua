local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    local result = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.notify("Failed to clone lazy.nvim:\n" .. result, vim.log.levels.ERROR)
        return
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = "andrey.plugins",
    change_detection = { notify = false },
})
