-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
}
end

-- typescript
lspconfig.ts_ls.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
}

-- rust_analyzer
lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
}

-- lua language server
lspconfig.lua_ls.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
}

-- tailwind language server
lspconfig.tailwindcss.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
}

-- markdown language server
lspconfig.markdown_oxide.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
}

-- basic_ls language server
lspconfig.basics_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
          settings = {
            snippet = {
              enable = true,
              sources = { vim.fn.stdpath("config") .. "/snippets" },
            },
          },
      })
