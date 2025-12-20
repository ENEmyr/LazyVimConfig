return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  dependencies = {
    {
      "copilotlsp-nvim/copilot-lsp",
      init = function()
        vim.g.copilot_nes_debounce = 500
      end,
    },
  },
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
    copilot_model = "gemini-3-flash",
    -- NES (Next Edit Suggestion) - requires copilot-lsp
    nes = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = false, -- We'll set custom keymap
        accept_and_goto = false,
        dismiss = false, -- We handle dismiss manually in Normal mode
      },
    },
  },
  config = function(_, opts)
    require("copilot").setup(opts)

    -- Manual keymap for Ctrl+Enter to accept suggestion (Insert mode)
    vim.keymap.set("i", "<C-CR>", function()
      local suggestion = require("copilot.suggestion")
      if suggestion.is_visible() then
        suggestion.accept()
      else
        -- Fallback: insert newline
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, false, true), "n", false)
      end
    end, { desc = "Accept Copilot suggestion" })

    -- NES keymap for Tab in Normal mode
    vim.keymap.set("n", "<Tab>", function()
      local bufnr = vim.api.nvim_get_current_buf()
      local state = vim.b[bufnr].nes_state
      if state then
        -- Try to jump to the start of the suggestion edit.
        -- If already at the start, then apply the pending suggestion and jump to the end of the edit.
        local _ = require("copilot-lsp.nes").walk_cursor_start_edit()
          or (
            require("copilot-lsp.nes").apply_pending_nes()
            and require("copilot-lsp.nes").walk_cursor_end_edit()
          )
        return nil
      else
        -- Fallback to Ctrl+i (jump forward)
        return "<C-i>"
      end
    end, { desc = "Accept Copilot NES suggestion", expr = true })

    -- Clear NES suggestion with Escape in Normal mode
    vim.keymap.set("n", "<Esc>", function()
      if not require("copilot-lsp.nes").clear() then
        -- Fallback: clear search highlight
        vim.cmd("nohlsearch")
      end
    end, { desc = "Clear Copilot NES or nohlsearch" })
  end,
}
