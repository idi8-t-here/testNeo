return {
    "williamboman/mason.nvim",
    dependencies = {
                'williamboman/mason-lspconfig.nvim',
                'mhartington/formatter.nvim',
                'jose-elias-alvarez/null-ls.nvim',
                'mfussenegger/nvim-dap',
                'rcarriga/nvim-dap-ui',
                'mfussenegger/nvim-lint',
                'neovim/nvim-lspconfig',
                },
    config = function ()
        require("mason").setup({
            ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
                }
            },
             ensure_installed = {
                'golangci-lint',
                'bash-language-server',
                'lua-language-server',
                'vim-language-server',
                'gopls',
                'stylua',
                'shellcheck',
                'sqlfmt',
                'editorconfig-checker',
                'gofumpt',
                'golines',
                'gomodifytags',
                'gotests',
                'goimports',
                'impl',
                'json-to-struct',
                'jq',
                'misspell',
                'revive',
                'shellcheck',
                'shfmt',
                'staticcheck',
                'vint',
                'yamllint',
                'yamlfmt',
                'yamlls',
                'hadolint',
                'dockerls',
                'diagnosticls',
                'sqlls',
                'terraformls',
                'delve'
  }
})
    end,
}

