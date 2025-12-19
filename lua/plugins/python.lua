-- Python development plugins
local is_linux = vim.fn.has("unix") == 1 and vim.fn.has("macunix") == 0

return {
  -- Docstring generator
  {
    "heavenshell/vim-pydocstring",
    branch = "master",
    build = "make install",
    ft = "python",
  },

  -- Jupyter notebook integration
  {
    "kiyoon/jupynium.nvim",
    build = "pip3 install --user .",
    ft = { "python", "jupyter" },
  },

  -- Luarocks (required for image.nvim)
  {
    "vhyrro/luarocks.nvim",
    priority = 1001,
    opts = {
      rocks = { "magick" },
    },
  },

  -- Molten: Jupyter-like code execution (Linux with image.nvim)
  {
    "benlubas/molten-nvim",
    enabled = is_linux,
    version = "^1.0.0",
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_wrap_output = true
    end,
  },

  -- Molten: Jupyter-like code execution (Windows/Mac with wezterm)
  {
    "benlubas/molten-nvim",
    enabled = not is_linux,
    version = "^1.0.0",
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "wezterm"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_wrap_output = true
    end,
  },
}
