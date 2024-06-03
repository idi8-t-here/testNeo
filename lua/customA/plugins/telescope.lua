return {
    "nvim-telescope/telescope.nvim", tag = '0.1.6' ,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
    },
    config = function()

        require('telescope').setup {
            defaults = {
                prompt_prefix = "󰼛 ",
                selection_caret = "󱞩 ",
                border = true,
                winblend = 5,
            },

        }

        --mappings
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>jj', builtin.git_files, {})
        vim.keymap.set('n', '<leader>gw', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>fc', builtin.commands, {})
        vim.keymap.set('n', '<leader>fr', builtin.registers, {})
        vim.keymap.set('n', '<leader>fs', builtin.spell_suggest, {})
        vim.keymap.set('n', '<leader>fl', builtin.current_buffer_fuzzy_find, {})
end,
}
