-- =============================================================================
-- Custom Plugins
-- =============================================================================
-- This file contains third-party plugins that extend the base LazyVim setup

local is_linux = vim.fn.has("unix") == 1 and vim.fn.has("macunix") == 0

return {
  -- =============================================================================
  -- Navigation & Motion
  -- =============================================================================
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    opts = {},
  },

  -- =============================================================================
  -- Editor Enhancements
  -- =============================================================================
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

  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "VeryLazy",
  },

  {
    "itchyny/vim-cursorword",
    event = "BufRead",
  },

  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },

  -- =============================================================================
  -- Git
  -- =============================================================================
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles" },
    dependencies = "nvim-lua/plenary.nvim",
  },

  -- =============================================================================
  -- Discord Rich Presence
  -- =============================================================================
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    opts = {
      auto_update = true,
      neovim_image_text = "The One True Text Editor",
      main_image = "neovim",
      client_id = "793271441293967371",
      debounce_timeout = 10,
      enable_line_number = false,
      buttons = true,
      editing_text = "Editing %s",
      file_explorer_text = "Browsing %s",
      git_commit_text = "Committing changes",
      plugin_manager_text = "Managing plugins",
      reading_text = "Reading %s",
      workspace_text = "Working on %s",
      line_number_text = "Line %s out of %s",
    },
    config = function(_, opts)
      require("presence"):setup(opts)
    end,
  },

  -- =============================================================================
  -- Task Runner
  -- =============================================================================
  {
    "stevearc/overseer.nvim",
    cmd = { "OverseerRun", "OverseerToggle", "OverseerQuickAction", "OverseerBuild" },
    opts = {},
  },

  -- =============================================================================
  -- Python Development
  -- =============================================================================
  {
    "heavenshell/vim-pydocstring",
    branch = "master",
    build = "make install",
    ft = "python",
  },

  {
    "kiyoon/jupynium.nvim",
    build = "pip3 install --user .",
    ft = { "python", "jupyter" },
  },

  -- =============================================================================
  -- Comments & TODOs
  -- =============================================================================
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = "BufRead",
    opts = {},
  },

  {
    "terrortylor/nvim-comment",
    event = "VeryLazy",
    opts = {
      comment_empty = false,
      create_mappings = true,
      line_mapping = "<leader>\\",
      operator_mapping = "<leader>\\",
    },
    config = function(_, opts)
      require("nvim_comment").setup(opts)
    end,
  },

  -- =============================================================================
  -- Session Management
  -- =============================================================================
  {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      auto_session_enabled = true,
      auto_save_enabled = true,
      auto_restore_enabled = true,
      pre_save_cmds = { "Neotree close" },
      save_extra_cmds = { "Neotree show" },
      post_restore_cmds = { "Neotree show" },
    },
  },

  -- =============================================================================
  -- LeetCode
  -- =============================================================================
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    lazy = "leet" ~= vim.fn.argv()[1],
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },

  -- =============================================================================
  -- Luarocks (for image.nvim)
  -- =============================================================================
  {
    "vhyrro/luarocks.nvim",
    priority = 1001,
    opts = {
      rocks = { "magick" },
    },
  },

  -- =============================================================================
  -- OpenCode.nvim
  -- =============================================================================
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        provider = {
          enabled = "snacks",
          snacks = {
            win = {
              position = "bottom",
              border = "rounded",
              height = 0.5,
              w = { ignore_gold_size = 1 },
            },
          },
          tmux = {
            options = "-h",
          },
        },
      }

      local map = vim.keymap.set

      map({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask OpenCode" })
      map({ "n", "x" }, "<C-x>", function() require("opencode").select() end, { desc = "Execute OpenCode action" })
      map({ "n", "x" }, "ga", function() require("opencode").prompt("@this") end, { desc = "Add to OpenCode" })
      map({ "n", "t" }, "<leader>at", function() require("opencode").toggle() end, { desc = "Toggle OpenCode" })
      map("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end, { desc = "OpenCode page up" })
      map("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "OpenCode page down" })

      -- Remap +/- for increment/decrement (since C-a/C-x are used by OpenCode)
      map("n", "+", "<C-a>", { desc = "Increment", noremap = true })
      map("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
    end,
  },

  -- =============================================================================
  -- Linux-specific Plugins
  -- =============================================================================
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

  {
    "lervag/vimtex",
    enabled = is_linux,
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "zathura"
    end,
  },
}
