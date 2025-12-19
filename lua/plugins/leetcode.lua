-- LeetCode integration
return {
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    lazy = "leet" ~= vim.fn.argv()[1],
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
}
