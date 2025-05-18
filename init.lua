vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "


vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.md",
  command = "loadview",
  group = vim.api.nvim_create_augroup("markdown_views", { clear = true }),
})

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- Ensure whichkey config is loaded
require("configs.whichkey")
require("configs.markdown")
require("configs.crates")
-- require("configs.scissors")

-- require("configs.cmp")
-- require("configs.luasnip")

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.filetype.add({
  extension = {
    md = "markdown",
  },
})

vim.filetype.add({
  extension = {
    md = "markdown",
    markdown = "markdown",
  },
  filename = {
    ["README"] = "markdown",
    ["README.md"] = "markdown",
  },
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
  pattern = { "*.md", "*.markdown", "README", "README.*" },
  callback = function()
    vim.bo.filetype = "markdown"
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.md",
  callback = function()
    vim.cmd("setfiletype markdown")
  end,
})

vim.schedule(function()
  require "mappings"
end)
