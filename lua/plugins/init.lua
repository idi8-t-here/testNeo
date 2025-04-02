return {
  {
    -- formatter i guess
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    --lsp
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    -- rust debugging
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
  },

  {
    "nvim-neotest/neotest",
    ft = "rust",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    }
  },

  {
    -- text2Colorscheme plugin
    "svermeulen/text-to-colorscheme.nvim",
    lazy = false,
    config = function()
      require "configs.text2Colorscheme"
    end,
  },

  {
    -- undotree
    "mbbill/undotree",
    event = "VeryLazy",
    config = function()
      require "configs.undo"
    end,
  },

  {
    -- flash plugin
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
        "html-lsp", "css-lsp", "prettier"
      },
    },
  },

  {
    -- lazygit plugin
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },

  {
    -- treesitter
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css"
      },
    },
  },

  {
    -- git pr management
    "ldelossa/gh.nvim",
    lazy = false,
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
  },

  {
    -- smart splits
    "mrjones2014/smart-splits.nvim"
  },

  {
    -- markdown rendering
    'MeanderingProgrammer/render-markdown.nvim',
    ft = 'markdown',
    priority = 1000,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'echasnovski/mini.nvim',
      {
        'L3MON4D3/LuaSnip',
        config = function()
          require("luasnip").config.setup({
            region_check_events = 'InsertEnter',
            delete_check_events = 'InsertLeave',
          })
          -- Only load non-markdown snippets here
          require("luasnip.loaders.from_vscode").lazy_load({
            paths = { vim.fn.stdpath("config") .. "/snippets" },
            exclude = { 'markdown' }
          })
        end,
      }
    },
    opts = {
      snippets = {
        enable = true,
        engine = "luasnip",
        path = vim.fn.stdpath("config") .. "/snippets/markdown",
      }
    },
  },

  {
    -- spectre
    "nvim-pack/nvim-spectre"
  },

  {
    -- autotag
    "windwp/nvim-ts-autotag",
    opts = {
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = false,
      per_filetype = {
        ["html"] = {
          enable_close = true,
        },
        ["javascriptreact"] = {
          enable_close = true,
        },
        ["typescriptreact"] = {
          enable_close = true,
        },
      }
    }
  },

  {
    -- snippet engine (configured earlier for markdown)
    "L3MON4D3/LuaSnip",
    event = "VeryLazy",
  },

  {
    -- AI plugin
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    opts = {
      provider = "openai",
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o",
        timeout = 30000,
        temperature = 0,
        max_tokens = 8192,
      },
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "echasnovski/mini.pick",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "ibhagwan/fzf-lua",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
    },
  },

  {
    "chrisgrieser/nvim-scissors",
    event = "VeryLazy",
    opts = {
      snippetDir = vim.fn.stdpath("config") .. "/snippets",
    },
    config = function(_, opts)
      require("scissors").setup(opts)
      
      -- Manually disable for markdown
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.b.scissors_disable = true  -- Disable scissors for markdown
        end,
      })
    end,
  }
}
