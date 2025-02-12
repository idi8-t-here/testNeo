-- Assuming you have which-key installed and configured
local wk = require("which-key")

-- Register keybindings with descriptions
wk.register({
  l = {
    name = "Scissors",  -- This will group the commands under 'l' as 'Scissors'
    e = { "<cmd>lua require('scissors').editSnippet()<cr>", "Edit Snippet" },
    a = { "<cmd>lua require('scissors').addNewSnippet()<cr>", "Add New Snippet" },
  },
}, { prefix = "<leader>" })
