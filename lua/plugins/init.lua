return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
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
      "nvim-treesitter/nvim-treesitter",
      "rouge8/neotest-rust" -- Correct repository for Rust support
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rust"), -- Enable Rust testing
        },
      })
    end,
  },

  {
    "svermeulen/text-to-colorscheme.nvim",
    lazy = false,
    config = function()
      require "configs.text2Colorscheme"
    end,
  },

  {
    "mbbill/undotree",
    event = "VeryLazy",
    config = function()
      require "configs.undo"
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "4", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "8", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "html-lsp", "css-lsp", "prettier"
      },
    },
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" } }
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "vim", "lua", "vimdoc", "html", "css" },
    },
  },

  {
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

  { "mrjones2014/smart-splits.nvim" },

  -- Render Markdown replacment
  -- {
  --     "OXY2DEV/markview.nvim",
  --     lazy = false,
  --
  --     -- For blink.cmp's completion
  --     -- source
  --     dependencies = {
  --         "saghen/blink.cmp"
  --     },
  -- },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    -- event = "BufReadPre",
    ft = "markdown",
    priority = 1000,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'echasnovski/mini.nvim',
      'saghen/blink.cmp'
    },
    opts = {
      snippets = {
        enable = true,
        engine = "luasnip",
        path = {
          vim.fn.stdpath("config") .. "/snippets",
          vim.fn.stdpath("config") .. "/snippets/markdown"
        },
      }
    }
  },

  { "nvim-pack/nvim-spectre" },

  {
    "windwp/nvim-ts-autotag",
    opts = {
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = false,
      per_filetype = {
        ["html"] = { enable_close = true },
        ["javascriptreact"] = { enable_close = true },
        ["typescriptreact"] = { enable_close = true },
      }
    }
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" }, -- optional, for more snippets
    event = "VeryLazy",
  },

  {
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
            drag_and_drop = { insert_mode = true },
            use_absolute_path = true,
          },
        },
      },
    },
  },

  {
    "chrisgrieser/nvim-scissors",
      event = "VeryLazy",
      dependencies = "nvim-telescope/telescope.nvim", -- if using telescope
      opts = {
        snippetDir = vim.fn.stdpath("config") .. "/snippets",
      },
  },

  {
      'saecki/crates.nvim',
      tag = 'stable',
      config = function()
          require('crates').setup()
      end,
  },

  {
      "kylechui/nvim-surround",
      version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  },

  {
      "sontungexpt/url-open",
      event = "VeryLazy",
      cmd = "URLOpenUnderCursor",
      config = function()
          local status_ok, url_open = pcall(require, "url-open")
          if not status_ok then
              return
          end
          url_open.setup ({})
      end,
  },

}
