-- Editor enhancement plugins
return {
  -- Code minimap
  {
    "wfxr/minimap.vim",
    build = "cargo install --locked code-minimap",
    cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
    init = function()
      vim.g.minimap_width = 10
      vim.g.minimap_auto_start = 1
      vim.g.minimap_auto_start_win_enter = 1
    end,
  },

  -- Color code highlighter
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      "*",
      css = { css = true },
    },
    config = function(_, opts)
      require("colorizer").setup(opts, {
        RGB = true,
        RRGGBB = true,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
      })
    end,
  },

  -- Golden ratio window sizing
  {
    "dm1try/golden_size",
    event = "VeryLazy",
    config = function()
      local golden_size = require("golden_size")

      local function ignore_by_buftype(types)
        local buftype = vim.bo.buftype
        for _, type in pairs(types) do
          if type == buftype then
            return 1
          end
        end
      end

      local function ignore_by_filetype(types)
        local filetype = vim.bo.filetype
        for _, type in pairs(types) do
          if type == filetype then
            return 1
          end
        end
      end

      golden_size.set_ignore_callbacks({
        { ignore_by_buftype, { "terminal", "quickfix", "nerdtree", "nofile", "minimap", "outline" } },
        { ignore_by_filetype, { "snacks_terminal", "snacks_input", "snacks_win" } },
        { golden_size.ignore_float_windows },
        { golden_size.ignore_by_window_flag },
      })
    end,
  },

  -- Multiple cursors
  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "VeryLazy",
  },

  -- Underline word under cursor
  {
    "itchyny/vim-cursorword",
    event = "BufRead",
  },

  -- Undo tree visualization
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },
}
