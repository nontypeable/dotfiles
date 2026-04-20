vim.keymap.set(
    "n",
    "<leader>nh",
    ":nohlsearch<CR>",
    { noremap = true, silent = true, desc = "Remove search highlighting" }
)

vim.keymap.set("n", "<leader>d", "<C-^>", { noremap = true, silent = true, desc = "Toggle between last two files" })

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })

vim.keymap.set({ "n", "i" }, "<C-l>", function()
    local rel_path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
    vim.fn.setreg("+", rel_path)
    vim.notify("Copied: " .. rel_path, vim.log.levels.INFO)
end, {
    noremap = true,
    silent = true,
    desc = "Copy relative file path to clipboard",
})

-- Tabs
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "H", "gT", { noremap = true, desc = "Go to previous tab" })
vim.keymap.set("n", "L", "gt", { noremap = true, desc = "Go to next tab" })

-- Moving lines in Visual Mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, desc = "Move line up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, desc = "Move line down" })
