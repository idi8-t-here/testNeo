return {
        "svermeulen/text-to-colorscheme.nvim",
        config = function ()
            require('text-to-colorscheme').setup {
                ai = {
                        openai_api_key = "myopenapikey",
                        gpt_model = "gpt-3.5-turbo-16k-0613",
                    },

                default_palette = "draculass",
hex_palettes = {
   {
      name = "draculass",
      background_mode = "dark",
      background = "#20222b",
      foreground = "#f7f7f2",
      accents = {
         "#8be8fc",
         "#66fa90",
         "#51fc7c",
         "#cfa6f7",
         "#ff78c4",
         "#f1fa8c",
         "#ff6e6e",
      }
   }
}
}
        end,
}
