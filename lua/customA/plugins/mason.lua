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
    config = function()
        -- Setup Mason
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

        -- Ensure language servers are set up
        local lspconfig = require("lspconfig")

        -- Configure individual language servers
        lspconfig.tsserver.setup{}  -- TypeScript server setup
        lspconfig.bashls.setup{}    -- Bash server setup
        lspconfig.lua_ls.setup{} -- Lua server setup, ensure you have sumneko_lua or lua_ls
        lspconfig.vimls.setup{}     -- Vim server setup
        lspconfig.gopls.setup{}     -- Go server setup
        lspconfig.yamlls.setup{}    -- YAML server setup
        lspconfig.dockerls.setup{}  -- Docker server setup
        lspconfig.sqlls.setup{}     -- SQL server setup
        lspconfig.terraformls.setup{} -- Terraform server setup
        lspconfig.clangd.setup{} -- c++ server setup
        lspconfig.cssls.setup{} -- css server setup
        lspconfig.cssmodules_ls.setup{} -- cssmodules server setup

        -- Define additional autocmds if necessary, but avoid using invalid function calls
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function()
                -- Placeholder for a valid command or function
                -- Example: vim.lsp.buf.formatting() or other valid LSP commands
            end
        })
    end,
}

