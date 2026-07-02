-- Indent, tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true

-- Appearance and navigation
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.pumheight = 5
vim.opt.cursorline = true
vim.opt.signcolumn = "auto"
vim.opt.scrolloff = 7
vim.opt.showcmd = true
vim.opt.wrap = true

-- Files, history, encoding, clipboard
vim.opt.swapfile = false
vim.opt.backup = false
local undodir = vim.fn.stdpath("state") .. "/undodir"
vim.opt.undodir = undodir
vim.fn.mkdir(undodir, "p")
vim.opt.undofile = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileformat = "unix"

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

-- Editing comfort
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400
