require("rlima.packer")


vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.title = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.scrolloff = 8
vim.opt.showcmd = true
vim.opt.cmdheight = 1


vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.shell = "fish"
vim.opt.lazyredraw = true
vim.opt.backspace = { "start", "eol", "indent" }

vim.g.mapleader = " "

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = '*',
    command = "set nopaste"
})

-- Set special indentation
local setIndentation = augroup("setIndentation", { clear = true })
autocmd("BufEnter", {
    command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2",
    pattern = { '*.rb', '*.erb', '*.xml', '*.json' },
    group = setIndentation
})

local formattingGroup = augroup("formattingGroup", { clear = true })
autocmd({ "BufWritePre" }, {
    group = formattingGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

