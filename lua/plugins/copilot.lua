return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = not vim.g.ai_cmp,
      auto_trigger = true,
      keymap = {
        accept = false, -- handled by nvim-cmp / blink.cmp
        -- next = "<C-]>",
        -- prev = "<C-[>",
        accept_word = "<C-]>",
        dismiss = "<C-[>",
        -- prev = "<C-[>",
        -- dismiss = false,
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
      tex = true,
    },
    copilot_model = "claude-sonnet-4.5",
  },
}
