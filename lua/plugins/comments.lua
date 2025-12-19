-- Comments and TODO highlighting
return {
  -- TODO/FIXME/etc highlighting
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = "BufRead",
    opts = {},
  },

  -- Comment toggle
  {
    "terrortylor/nvim-comment",
    event = "VeryLazy",
    opts = {
      comment_empty = false,
      create_mappings = true,
      line_mapping = "<leader>\\",
      operator_mapping = "<leader>\\",
    },
    config = function(_, opts)
      require("nvim_comment").setup(opts)
    end,
  },
}
