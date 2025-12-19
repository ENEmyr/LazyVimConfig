-- Git plugins
return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles" },
    dependencies = "nvim-lua/plenary.nvim",
  },
}
