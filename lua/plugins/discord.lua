-- Discord Rich Presence (supports WSL)
return {
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    event = "VeryLazy",
    opts = {
      editor = {
        client = "lazyvim",
        tooltip = "The One True Text Editor",
      },
      display = {
        theme = "catppuccin",
      },
      text = {
        workspace = function(opts)
          return "In " .. opts.workspace
        end,
        viewing = function(opts)
          return "Viewing " .. opts.filename
        end,
        editing = function(opts)
          return "Editing " .. opts.filename
        end,
        file_browser = function(opts)
          return "Browsing files in " .. opts.name
        end,
        plugin_manager = function(opts)
          return "Managing plugins in " .. opts.name
        end,
        lsp = function(opts)
          return "Configuring LSP in " .. opts.name
        end,
        vcs = function(opts)
          return "Committing changes in " .. opts.name
        end,
      },
      buttons = {
        {
          label = function(opts)
            return opts.repo_url and "View Repository" or nil
          end,
          url = function(opts)
            return opts.repo_url
          end,
        },
      },
      advanced = {
        discord = {
          -- WSL: socat creates socket at /tmp/discord-ipc-0
          pipe_paths = { "/tmp/discord-ipc-0" },
          reconnect = {
            enabled = true,
            interval = 5000,
            initial = true,
          },
        },
      },
    },
  },
}
