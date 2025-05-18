local wk = require("which-key")

wk.setup({
  notify = false, -- disable warnings
})

-- Updated which-key definitions using the new format
wk.register({
  { "<leader>l", group = "Snippets" },
  { "<leader>la", desc = "Add New Snippet" },
  { "<leader>le", desc = "Edit Snippet" },
})

wk.register({
  { "<leader>i", group = "Neotest..." },
  { "<leader>ia", desc = "Run Test (all) - [Neotest]" },
  { "<leader>ih", desc = "Inlay Hints" },
  { "<leader>ii", desc = "Toggle Watch - [Neotest]" },
  { "<leader>io", desc = "Stop Test - [Neotest]" },
  { "<leader>is", desc = "Test Summary - [Neotest]" },
  { "<leader>iu", desc = "Run Test (on-cursor) - [Neotest]" },
})
