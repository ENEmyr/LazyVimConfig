return {
  "folke/edgy.nvim",
  opts = function(_, opts)
    opts.bottom = opts.bottom or {}
    -- table.insert(opts.bottom, {
    --   ft = "copilot-chat",
    --   title = "Copilot Chat",
    --   size = { height = 0.35 },
    -- })
  end,
}
