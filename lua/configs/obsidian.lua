require('obsidian').setup({
        dir = "~/obsidian notes/", -- Update this path
        daily_notes = {
          folder = "Daily",
          date_format = "%Y-%m-%d"
        },
        completion = {
          nvim_cmp = true,
        },
        mappings = {
          follow_url = "<leader>ou",
          new_note = "<leader>on",
          new_daily_note = "<leader>fd",
          search_notes = "<leader>fs"
        }
})
