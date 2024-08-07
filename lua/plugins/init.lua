return {
  {
        -- formatter i guess
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
        --lsp
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
        --text2Colorscheme plugin//doesnt really work tho
    "svermeulen/text-to-colorscheme.nvim",
    config = function()
      require "configs.text2Colorscheme"
    end,
  },

  {
        --undotree
    "mbbill/undotree",
    event = "VeryLazy",
    config = function()
      require "configs.undo"
    end,
  },

  {
        --flash plugin //this really works//
    "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },

  },

  {
        -- language package manager
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier"
  		},
  	},
  },

  {
        -- to improve git workflow [lazy git plugin]
    "kdheepak/lazygit.nvim",
    cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
    },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
  }
  },

  {
        -- syntax highlighter i guess :shrugges:
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },

  {
        -- for git pr managment integration 
    "ldelossa/gh.nvim",
    dependencies = {
        {
        "ldelossa/litee.nvim",
        config = function()
            require("litee.lib").setup()
        end,
        },
    },
    config = function()
        require("litee.gh").setup()
    end,
  }
}
