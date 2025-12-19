# Neovim Configuration

My Personal Neovim configuration based on [LazyVim](https://github.com/LazyVim/LazyVim).

## Directory Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── config/
│   │   ├── autocmds.lua     # Auto commands
│   │   ├── keymaps.lua      # Key mappings
│   │   ├── lazy.lua         # Plugin manager setup
│   │   └── options.lua      # Neovim options
│   └── plugins/
│       ├── bufferline.lua   # Buffer tabs
│       ├── comments.lua     # Comment toggle & TODO highlights
│       ├── copilot.lua      # GitHub Copilot
│       ├── custom_color_scheme.lua
│       ├── discord.lua      # Discord Rich Presence
│       ├── editor.lua       # Editor enhancements
│       ├── fzf-lua.lua      # Fuzzy finder
│       ├── git.lua          # Git tools (diffview)
│       ├── indent-blankline.lua
│       ├── latex.lua        # LaTeX support (Linux only)
│       ├── leetcode.lua     # LeetCode integration
│       ├── lsp.lua          # LSP configuration
│       ├── mason.lua        # LSP/DAP installer
│       ├── mini-surround.lua
│       ├── navigation.lua   # Quick navigation (hop)
│       ├── nvim-cmp.lua     # Autocompletion
│       ├── nvim-ufo.lua     # Code folding
│       ├── opencode.lua     # AI coding assistant
│       ├── overseer.lua     # Task runner
│       ├── python.lua       # Python development
│       ├── session.lua      # Session management
│       └── treesitter.lua   # Syntax highlighting
└── lazy-lock.json           # Plugin version lock file
```

## Keymaps

### General

| Key          | Mode | Description         |
| ------------ | ---- | ------------------- |
| `<leader>\\` | n    | Toggle comment      |
| `<leader>pv` | n    | Vertical split      |
| `<leader>ph` | n    | Horizontal split    |
| `<leader>pd` | n    | Close pane          |
| `<leader>uU` | n    | Toggle Undotree     |
| `<leader>uo` | n    | Toggle code outline |

### OpenCode (AI Assistant)

| Key          | Mode | Description                          |
| ------------ | ---- | ------------------------------------ |
| `<C-a>`      | n, x | Ask OpenCode about current context   |
| `<C-x>`      | n, x | Execute OpenCode action              |
| `ga`         | n, x | Add to OpenCode context              |
| `<leader>at` | n, t | Toggle OpenCode terminal             |
| `<S-C-u>`    | n    | OpenCode page up                     |
| `<S-C-d>`    | n    | OpenCode page down                   |
| `+`          | n    | Increment number (remapped from C-a) |
| `-`          | n    | Decrement number (remapped from C-x) |

### Copilot (AI Completion)

| Key       | Mode | Description              |
| --------- | ---- | ------------------------ |
| `<C-CR>`  | i    | Accept Copilot suggestion |
| `<C-]>`   | i    | Accept word              |
| `<Esc>`   | i    | Dismiss suggestion       |

### Hop (Quick Navigation)

| Key          | Mode | Description               |
| ------------ | ---- | ------------------------- |
| `<leader>ww` | n    | Hop to word               |
| `<leader>wl` | n    | Hop to word after cursor  |
| `<leader>wh` | n    | Hop to word before cursor |
| `<leader>ws` | n    | Hop with 2-char search    |

### Molten (Jupyter-like Code Execution)

| Key          | Mode | Description            |
| ------------ | ---- | ---------------------- |
| `<leader>mi` | n    | Initialize kernel      |
| `<leader>mI` | n    | De-initialize buffer   |
| `<leader>ml` | n    | Run current line       |
| `<leader>mr` | n    | Re-run active cell     |
| `<leader>mR` | n    | Restart kernel         |
| `<leader>mb` | n    | Interrupt running code |
| `<leader>mo` | n    | Run operator selection |
| `<leader>mn` | n    | Next code cell         |
| `<leader>mp` | n    | Previous code cell     |
| `<leader>me` | n    | Enter output window    |
| `<leader>mh` | n    | Hide output window     |
| `<leader>ms` | n    | Show output window     |
| `<leader>mm` | n    | Popup image            |
| `<leader>mv` | v    | Run visual selection   |

### Overseer (Task Runner)

| Key          | Mode | Description     |
| ------------ | ---- | --------------- |
| `<leader>or` | n    | Run task        |
| `<leader>ot` | n    | Toggle Overseer |
| `<leader>oa` | n    | Quick action    |
| `<leader>ob` | n    | Build           |
| `<leader>oc` | n    | Run command     |
| `<leader>ol` | n    | Load bundle     |
| `<leader>os` | n    | Save bundle     |
| `<leader>od` | n    | Delete bundle   |

### Buffer Navigation

| Key          | Mode | Description                 |
| ------------ | ---- | --------------------------- |
| `<leader>bf` | n    | Find buffer (Telescope)     |
| `<leader>bj` | n    | Jump to buffer (BufferLine) |

### Thai Keyboard Support

Thai keyboard mappings (Kedmanee layout) are configured for normal mode navigation.
When typing Thai, vim commands still work:

| Thai Key | Maps To | Example                   |
| -------- | ------- | ------------------------- |
| `ก`      | `d`     | `กก` = `dd` (delete line) |
| `ั`      | `y`     | `ัั` = `yy` (yank line)   |
| `เเ`     | `gg`    | Go to top of file         |
| `<C-ี>`  | `<C-u>` | Page up                   |
| `<C-ก>`  | `<C-d>` | Page down                 |

## Plugins

### Language Support (via LazyVim Extras)

- TypeScript/JavaScript
- Python (pyright + ruff)
- C/C++ (clangd)
- JSON
- LaTeX (texlab)

### AI

- **GitHub Copilot** - AI code completion
- **OpenCode.nvim** - AI coding assistant with chat interface

### Editor Enhancements

| Plugin               | Description                         |
| -------------------- | ----------------------------------- |
| `hop.nvim`           | Quick cursor navigation             |
| `minimap.vim`        | Code minimap sidebar                |
| `nvim-colorizer.lua` | Color code highlighting             |
| `golden_size`        | Auto-resize windows to golden ratio |
| `vim-visual-multi`   | Multiple cursors                    |
| `vim-cursorword`     | Underline word under cursor         |
| `undotree`           | Undo history visualization          |

### Git

| Plugin          | Description     |
| --------------- | --------------- |
| `diffview.nvim` | Git diff viewer |

### Python Development

| Plugin            | Description                  |
| ----------------- | ---------------------------- |
| `vim-pydocstring` | Generate docstrings          |
| `jupynium.nvim`   | Jupyter notebook integration |
| `molten-nvim`     | Jupyter-like code execution  |

### Others

| Plugin               | Description                  |
| -------------------- | ---------------------------- |
| `auto-session`       | Automatic session management |
| `todo-comments.nvim` | TODO/FIXME highlighting      |
| `nvim-comment`       | Comment toggle               |
| `overseer.nvim`      | Task runner                  |
| `presence.nvim`      | Discord Rich Presence        |
| `leetcode.nvim`      | LeetCode integration         |
| `vimtex`             | LaTeX support (Linux only)   |

## Adding & Configuring Plugins

### Adding a New Plugin

Create a new file in `lua/plugins/` or add to an existing category file:

```lua
-- lua/plugins/example.lua
return {
  {
    "author/plugin-name",
    -- Lazy loading options
    event = "BufRead",        -- Load on buffer read
    -- OR
    cmd = { "PluginCommand" }, -- Load on command
    -- OR
    ft = { "python", "lua" }, -- Load for specific filetypes
    -- OR
    keys = {                   -- Load on keymap
      { "<leader>xx", "<cmd>PluginCommand<cr>", desc = "Description" },
    },

    -- Dependencies
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    -- Build command (run after install/update)
    build = "make install",

    -- Configuration using opts (recommended)
    opts = {
      option1 = true,
      option2 = "value",
    },
  },
}
```

### Using `opts` vs `config`

**Prefer `opts`** - LazyVim will automatically call `require("plugin").setup(opts)`:

```lua
-- Good: Using opts
{
  "plugin/name",
  opts = {
    setting = true,
  },
}

-- Good: Using opts as function (when you need access to default opts)
{
  "plugin/name",
  opts = function(_, opts)
    opts.setting = true
    return opts
  end,
}
```

**Use `config` only when necessary** - For complex setup logic:

```lua
-- When you need custom setup logic
{
  "plugin/name",
  config = function(_, opts)
    -- Custom logic before setup
    local plugin = require("plugin")
    plugin:setup(opts)  -- Non-standard setup call
    -- Custom logic after setup
  end,
}
```

### Overriding Existing Plugin Config

To modify a plugin already configured by LazyVim, create a file with the same plugin spec:

```lua
-- lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- Modify opts table
    opts.servers = opts.servers or {}
    opts.servers.pyright = {
      enabled = true,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
          },
        },
      },
    }
  end,
}
```

### Plugin Loading Events

| Event         | When                      |
| ------------- | ------------------------- |
| `VeryLazy`    | After UI is ready         |
| `BufRead`     | When a buffer is read     |
| `BufReadPre`  | Before a buffer is read   |
| `BufEnter`    | When entering a buffer    |
| `InsertEnter` | When entering insert mode |

## OS-Specific Configuration

### Detecting Operating System

```lua
-- Detect Linux (excluding macOS)
local is_linux = vim.fn.has("unix") == 1 and vim.fn.has("macunix") == 0

-- Detect macOS
local is_macos = vim.fn.has("macunix") == 1

-- Detect Windows
local is_windows = vim.fn.has("win32") == 1
```

### Conditional Plugin Loading

```lua
-- lua/plugins/latex.lua
local is_linux = vim.fn.has("unix") == 1 and vim.fn.has("macunix") == 0

return {
  {
    "lervag/vimtex",
    enabled = is_linux,  -- Only enable on Linux
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "zathura"
    end,
  },
}
```

### Different Config per OS

```lua
-- lua/plugins/python.lua
local is_linux = vim.fn.has("unix") == 1 and vim.fn.has("macunix") == 0

return {
  -- Linux version (uses image.nvim)
  {
    "benlubas/molten-nvim",
    enabled = is_linux,
    dependencies = { "3rd/image.nvim" },
    init = function()
      vim.g.molten_image_provider = "image.nvim"
    end,
  },

  -- Windows/Mac version (uses wezterm)
  {
    "benlubas/molten-nvim",
    enabled = not is_linux,
    init = function()
      vim.g.molten_image_provider = "wezterm"
    end,
  },
}
```

### Neovide (GUI) Settings

Settings specific to Neovide GUI are in `lua/config/options.lua`:

```lua
if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.8
  vim.g.neovide_refresh_rate = 144
  vim.g.neovide_transparency = 0.95
  vim.o.guifont = "CaskaydiaCove Nerd Font:h14"
  -- ... more Neovide settings
end
```

## LazyVim Extras

Enabled extras in `lua/config/lazy.lua`:

```lua
-- Language support
{ import = "lazyvim.plugins.extras.lang.typescript" },
{ import = "lazyvim.plugins.extras.lang.json" },
{ import = "lazyvim.plugins.extras.lang.python" },
{ import = "lazyvim.plugins.extras.lang.clangd" },

-- AI
{ import = "lazyvim.plugins.extras.ai.copilot" },

-- Coding
{ import = "lazyvim.plugins.extras.coding.nvim-cmp" },
{ import = "lazyvim.plugins.extras.coding.mini-comment" },
{ import = "lazyvim.plugins.extras.coding.mini-surround" },

-- Editor
{ import = "lazyvim.plugins.extras.editor.outline" },
{ import = "lazyvim.plugins.extras.editor.mini-move" },
{ import = "lazyvim.plugins.extras.editor.navic" },

-- DAP
{ import = "lazyvim.plugins.extras.dap.core" },

-- Formatting
{ import = "lazyvim.plugins.extras.formatting.black" },
{ import = "lazyvim.plugins.extras.formatting.prettier" },

-- UI
{ import = "lazyvim.plugins.extras.ui.treesitter-context" },
```

## Useful Commands

| Command              | Description            |
| -------------------- | ---------------------- |
| `:Lazy`              | Open plugin manager    |
| `:Mason`             | Open LSP/DAP installer |
| `:LspInfo`           | Show LSP status        |
| `:checkhealth`       | Check Neovim health    |
| `:Telescope keymaps` | Search keymaps         |

## License

MIT
