-- Set leader key BEFORE loading plugins
vim.g.mapleader = " " -- spacebar as leader key

-- Load plugin manager
require("myconfig.lazy")

-- UI Settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Theme
vim.cmd("colorscheme tokyonight")

require("nvim-tree").setup({
    filters = {
        dotfiles = false, -- <- THIS makes sure .env and other dotfiles are shown
    },
    git = {
        enable = true,
        ignore = false, -- <- THIS shows files that Git normally ignores (like .env, node_modules)
    },
})

-- Keybindings
-- Fuzzy finder (Telescope)
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")

-- Toggle file tree
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

-- Move lines (normal mode)
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")

-- Move lines (visual mode)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Format with Prettier
vim.keymap.set("n", "<leader>p", ":%!prettier --write %<CR>")

-- Open terminal in a horizontal split with <leader>t
vim.keymap.set("n", "<leader>t", function()
    vim.cmd("belowright split | terminal")
end, { desc = "Open Terminal Split" })

-- Let ESC exit terminal mode like a regular buffer
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = "Exit terminal mode" })



-- Tab navigation
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")

-- For copying in terminal using ctrl+C :
vim.keymap.set('v', '<C-c>', '"+y')


local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
    },
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format()
    end,
})

-- Map <Tab> to switch focus between splits
vim.keymap.set('n', '<Tab>', '<C-w>w')
vim.keymap.set('n', '<S-Tab>', '<C-w>W')

vim.api.nvim_create_autocmd("FileType", {
    pattern = "NvimTree",
    callback = function()
        vim.keymap.set('n', '<Tab>', '<C-w>w', { buffer = true })
    end,
})

-- Normal mode: move current line up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==")

-- Visual mode: move selected lines up/down
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv=gv")
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv=gv")
vim.keymap.set("x", "<A-Down>", ":move '>+1<CR>gv=gv")
vim.keymap.set("x", "<A-Up>", ":move '<-2<CR>gv=gv")
