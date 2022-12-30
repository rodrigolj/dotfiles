require("rlima.keymap")
--local map = require("rlima.keymap").map
local nmap = require("rlima.keymap").nmap
local nnoremap = require("rlima.keymap").nnoremap
local vnoremap = require("rlima.keymap").vnoremap
local xnoremap = require("rlima.keymap").xnoremap
local silent = { silent = true }


vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>")
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>pv", function() vim.cmd("Ex") end)


vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
nnoremap("J", "mzJ`z")
nnoremap("<leader>sf", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- greatest remap ever
xnoremap("<leader>p", "\"_dP")

-- Yank to system clipboard
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

-- Delete
nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

-- Formatting
nnoremap("<F7>", "gg=G")
nnoremap("<F8>", function() vim.lsp.buf.format() end)

nnoremap("<leader>ff", function() require('telescope.builtin').find_files() end)
nnoremap("<leader>fg", function() require('telescope.builtin').git_files() end)
nnoremap("<leader>fb", function() require('telescope.builtin').buffers() end)
nnoremap("<leader>ht", function() require('telescope.builtin').help_tags() end)
nnoremap("<leader>fs", function() require('telescope.builtin').lsp_document_symbols() end)
nnoremap("<leader>fd", function() require('telescope.builtin').current_buffer_fuzzy_find() end)
nnoremap("<leader>fk", function() require('telescope.builtin').keymaps() end)
nnoremap("<leader>fn",
    function() require('telescope.builtin').find_files({ cwd = "~/.config",
            search_dirs = { "i3", "bspwm", "nvim", "polybar", "sxhkd", "picom", "alacritty" } })
    end, silent)

-- Split Views
nnoremap("sh", vim.cmd.split)
nnoremap("sv", vim.cmd.vsplit)
nnoremap("sh", "<C-w>h")
nnoremap("sj", "<C-w>j")
nnoremap("sk", "<C-w>k")
nnoremap("sl", "<C-w>l")

-- Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
