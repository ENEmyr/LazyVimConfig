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
        accept = false, -- We'll set it manually below
        accept_word = "<C-]>",
        dismiss = "<Esc>",
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
  config = function(_, opts)
    require("copilot").setup(opts)

    -- Manual keymap for Ctrl+Enter to accept suggestion
    vim.keymap.set("i", "<C-CR>", function()
      local suggestion = require("copilot.suggestion")
      if suggestion.is_visible() then
        suggestion.accept()
      else
        -- Fallback: insert newline
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, false, true), "n", false)
      end
    end, { desc = "Accept Copilot suggestion" })
  end,
}
