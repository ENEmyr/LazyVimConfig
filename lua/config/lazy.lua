local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- LazyVim core
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- Language support
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.clangd" },

    -- AI
    { import = "lazyvim.plugins.extras.ai.copilot" },

    -- Coding enhancements
    { import = "lazyvim.plugins.extras.coding.nvim-cmp" },
    { import = "lazyvim.plugins.extras.coding.mini-comment" },
    { import = "lazyvim.plugins.extras.coding.mini-surround" },

    -- Editor features
    { import = "lazyvim.plugins.extras.editor.outline" },
    { import = "lazyvim.plugins.extras.editor.mini-move" },
    { import = "lazyvim.plugins.extras.editor.navic" },

    -- DAP (Debug Adapter Protocol)
    { import = "lazyvim.plugins.extras.dap.core" },

    -- Formatting
    { import = "lazyvim.plugins.extras.formatting.black" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },

    -- UI enhancements
    { import = "lazyvim.plugins.extras.ui.treesitter-context" },

    -- Custom plugins
    { import = "plugins" },
  },

  defaults = {
    lazy = false,
    version = false, -- Always use latest git commit
  },

  install = {
    colorscheme = { "catppuccin", "tokyonight", "habamax" },
  },

  checker = {
    enabled = true, -- Auto-check for plugin updates
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
