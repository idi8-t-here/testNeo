require "nvchad.mappings"

-- add yours here

local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

-- .netrw configs
vim.keymap.set("n", "<leader>rw", vim.cmd.Ex)

-- cmdline entry
-- vim.keymap.set("n", ";", ":")

-- Navigate buffers
vim.keymap.set("n", "<Tab>i", ":bnext<CR>")
vim.keymap.set("n", "<Tab>k", ":bprevious<CR>")

--Code Block navigation
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)

--annoying shit {sigh...}
vim.keymap.set("n", "G", "gg", opts)
vim.keymap.set("n", "gg", "G", opts)
vim.keymap.set("v", "G", "gg", opts)
vim.keymap.set("v", "gg", "G", opts)
    -- Remap > and < to keep visual mode after indenting
    vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })

for i = 0, 999 do
    --delete
    vim.keymap.set("n", "d" .. i .. "i", "d" .. i .. "k", opts)
    vim.keymap.set("n", "d" .. i .. "k", "d" .. i .. "j", opts)
    vim.keymap.set("n", "d" .. i .. "j", "d" .. i .. "h", opts)
    vim.keymap.set("n", "dh", "di", opts)

    --change
    vim.keymap.set("n", "c" .. i .. "i", "c" .. i .. "k", opts)
    vim.keymap.set("n", "c" .. i .. "k", "c" .. i .. "j", opts)
    vim.keymap.set("n", "c" .. i .. "j", "c" .. i .. "h", opts)
    vim.keymap.set("n", "ch", "ci", opts)

    --wrap
    vim.keymap.set("n", "vi", "vh", opts)
end

--undo-tree toggle
vim.keymap.set("n","<leader>u",":UndotreeToggle<CR>",opts)

-- Nvim Tree Keymaps
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

--Clipboard remaps
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')

            vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>p", '"+p')

-- Tmux Navigation(no longer needed, use nvim to multiplex my terminal nowadays)

-- vim.keymap.set("n", "<M-h>", "<cmd> TmuxNavigateLeft<CR>")
-- vim.keymap.set("n", "<M-j>", "<cmd> TmuxNavigateDown<CR>")
-- vim.keymap.set("n", "<M-k>", "<cmd> TmuxNavigateUp<CR>")
-- vim.keymap.set("n", "<M-l>", "<cmd> TmuxNavigateRight<CR>")

-- debugging
vim.keymap.set("n", "<M-b>", '<cmd>lua require("dap").continue()<CR>', opts)
vim.keymap.set("n", "<M-x>", '<cmd>lua require("dap").toggle_breakpoint()<CR>', opts)
vim.keymap.set("n", "<M-r>", '<cmd>lua require("dap").repl.open()<CR>', opts)
vim.keymap.set("n", "<M-v>", '<cmd>lua require("dap").step_over()<CR>', opts)
vim.keymap.set("n", "<M-i>", '<cmd>lua require("dap").step_into()<CR>', opts)
vim.keymap.set("n", "<M-o>", '<cmd>lua require("dap").step_out()<CR>', opts)
vim.keymap.set("n", "<M-u>", '<cmd>lua require("dapui").toggle()<CR>', opts)

--tab navigation
vim.keymap.set("n", "tn", ":tabnext<CR>")
vim.keymap.set("n", "tp", ":tabprevious<CR>")
vim.keymap.set("n", "tq", ":tabclose<CR>")
vim.keymap.set("n", "te", ":tabedit<CR>")
vim.keymap.set("n", "ts", ":tab split<CR>")
vim.keymap.set("n", "tv", ":tab vsplit<CR>")

--commenting
-- not needed in nvim version 0.10

--lsp binds
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.keymap.set("n", "gpr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.keymap.set("n", "gpi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.keymap.set("n", "M", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.keymap.set("n", "T", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.keymap.set("n", "[e", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
vim.keymap.set("n", "]e", '<cmd>lua vim.diagnostic.goto_next({border="rounded"})<CR>', opts)
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

vim.keymap.set("n", "gx", '<cmd>lua require("goto-preview").close_all_win()<CR>', opts)
vim.keymap.set("n", "gr", '<cmd>lua require("goto-preview").goto_preview_references()<CR>', opts)
vim.keymap.set("n", "gi", '<cmd>lua require("goto-preview").goto_preview_implementation()<CR>', opts)
-- vim.keymap.set("n", "m", '<cmd>lua require("goto-preview").goto_preview_definition()<CR>', opts)

-- scrolling

vim.keymap.set("n", "<C-Up>", "<C-u>zz")
vim.keymap.set("n", "<C-Down>", "<C-d>zz")

-- trouble

vim.keymap.set("n", "<leader>tl", "<cmd>TroubleToggle<cr>", opts)

--wrapping
vim.keymap.set("n", "<M-z>", "<cmd>set wrap!<CR>", opts)

--nvim new features(v0.10)
vim.keymap.set("n","<leader>ih",function ()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)

--For splits resizing and navigation
-- { for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)` }
vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
-- { moving between splits }
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
-- { swapping buffers between windows }
vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
