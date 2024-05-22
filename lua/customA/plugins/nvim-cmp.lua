return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        'ms-jpq/coq.thirdparty',
        "hrsh7th/cmp-path",
        'ms-jpq/coq_nvim',
        'ms-jpq/coq.artifacts',
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim",
        "saadparwaiz1/cmp_luasnip",
        {"L3MON4D3/LuaSnip", build = "make install_jsregexp", version = "2.*"},
    },
    config = function ()
        local cmp = require ("cmp")

        local luasnip = require ("luasnip")

        local lspkind = require ("lspkind")

        --load snippets from plugins
        require ("luasnip.loaders.from_vscode").lazy_load()

        vim.opt.completeopt = "menu,menuone,noselect"
        cmp.setup ({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = {
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-n>"] = cmp.mapping.scroll_docs(-4),
				["<C-p>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- lsp
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
            }),
            formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
        })
    end,
}
