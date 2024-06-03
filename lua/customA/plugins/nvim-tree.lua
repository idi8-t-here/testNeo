return {
	"nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
        dependecies = {
            "nvim-tree/nvim-web-devicons"
        },
    --function to execute with the start of nvim tree
    config = function()
        require("nvim-tree").setup {}
    end,

    --Navigate splits
    vim.keymap.set("n", "<S-h>", "<C-w>h"),
    vim.keymap.set("n", "<S-l>", "<C-w>l"),
    vim.keymap.set("n", "<S-k>", "<C-w>k"),
    vim.keymap.set("n", "<S-j>", "<C-w>j"),
}


