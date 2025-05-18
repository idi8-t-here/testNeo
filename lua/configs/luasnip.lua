local luasnip = require("luasnip")

-- Load friendly-snippets (VS Code style)
require("luasnip.loaders.from_vscode").lazy_load()

-- Load scissors-style SnipMate snippets
require("luasnip.loaders.from_snipmate").lazy_load({
  paths = vim.fn.stdpath("config") .. "/snippets",
})
