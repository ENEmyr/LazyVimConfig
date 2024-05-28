function OS()
  return package.config:sub(1, 1) == "\\" and "win" or "unix"
end

function TableConcat(t1, t2)
  for i = 1, #t2 do
    t1[#t1 + 1] = t2[i]
  end
  return t1
end

PLUGINS = {
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
    end,
  },
  {
    "wfxr/minimap.vim",
    build = "cargo install --locked code-minimap", -- Minimap
    cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
    config = function()
      vim.cmd("let g:minimap_width = 10")
      vim.cmd("let g:minimap_auto_start = 1")
      vim.cmd("let g:minimap_auto_start_win_enter = 1")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua", -- Display colors code as colors
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS functions: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "dm1try/golden_size", -- golden ratio
    config = function()
      local function ignore_by_buftype(types)
        local buftype = vim.api.nvim_buf_get_option(0, "buftype")
        for _, type in pairs(types) do
          if type == buftype then
            return 1
          end
        end
      end

      local golden_size = require("golden_size")
      -- set the callbacks, preserve the defaults
      golden_size.set_ignore_callbacks({
        { ignore_by_buftype, { "terminal", "quickfix", "nerdtree", "nofile", "minimap", "outline" } }, -- nofile is the filetype of NvimTree
        { golden_size.ignore_float_windows }, -- default one, ignore float windows
        { golden_size.ignore_by_window_flag }, -- default one, ignore windows with w:ignore_gold_size=1
      })
    end,
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
  },
  {
    "andweeb/presence.nvim",
    config = function()
      require("presence"):setup({
        -- General options
        auto_update = true, -- Update activity based on autocmd events (if false, map or manually execute :lua package.loaded.presence:update())
        neovim_image_text = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
        main_image = "neovim", -- Main image display (either "neovim" or "file")
        client_id = "793271441293967371", -- Use your own Discord application client id (not recommended)
        log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
        debounce_timeout = 10, -- Number of seconds to debounce events (or calls to :lua package.loaded.presence:update(<filename>, true))
        enable_line_number = false, -- Displays the current line number instead of the current project
        blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
        buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table ({{ label = "<label>", url = "<url>" }, ...}, or a function(buffer: string, repo_url: string|nil): table)
        -- Rich Presence text options
        editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text = "Line %s out of %s", -- Format string rendered when enable_line_number is set to true (either string or function(line_number: number, line_count: number): string)
      })
    end,
  },
  {
    "stevearc/overseer.nvim",
    config = function()
      require("overseer").setup()
    end,
  },
  {
    "heavenshell/vim-pydocstring",
    branch = "master",
    build = "make install",
  },
  {
    "itchyny/vim-cursorword", -- underline the word under the cursor
  },
  {
    "sindrets/diffview.nvim", -- check file diff, merge
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "mbbill/undotree",
  },
  {
    "vhyrro/luarocks.nvim", -- luarocks --lua-version=5.1 install magick
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        auto_session_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = true,
      })
    end,
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- configuration goes here
    },
  },
  -- {
  --   "tmhedberg/SimpylFold",
  --   init = function ()
  --     -- enable docstring preview in fold text
  --     vim.g.SimpylFold_docstring_preview = 1
  --   end
  -- },
  -- {
  --   "p00f/nvim-ts-rainbow", -- Rainbow parentheses
  --   config = function()
  --     require("nvim-treesitter.configs").setup({
  --       rainbow = {
  --         enable = true,
  --         extended_mode = true,
  --       },
  --     })
  --   end,
  -- },
}

LINUX_PLUGINS = {
  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("image").setup({
        backend = "kitty", -- Kitty will provide the best experience, but you need a compatible terminal
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
          },
        }, -- do whatever you want with image.nvim's integrations
        max_width = 150, -- tweak to preference
        max_height = 18, -- ^
        max_height_window_percentage = math.huge, -- this is necessary for a good experience
        max_width_window_percentage = math.huge,
        window_overlap_clear_enabled = true,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
      })
    end,
  },
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_wrap_output = true
      -- vim.g.molten_output_show_more = true
      -- vim.g.molten_output_crop_border = false
      -- vim.g.molten_output_win_borderr = { "", "━", "", "" }
      -- vim.g.molten_virt_text_output = false
    end,
  },
}

WINDOWS_PLUGINS = {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "wezterm"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_wrap_output = true
    end,
  },
}

if OS() == "unix" then
  TableConcat(PLUGINS, LINUX_PLUGINS)
else
  TableConcat(PLUGINS, WINDOWS_PLUGINS)
end

return PLUGINS
