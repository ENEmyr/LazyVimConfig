-- Session management
return {
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
}
