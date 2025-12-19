-- OpenCode.nvim - AI coding assistant
return {
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
}
