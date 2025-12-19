-- LaTeX support (Linux only - uses zathura)
local is_linux = vim.fn.has("unix") == 1 and vim.fn.has("macunix") == 0

return {
  {
    "lervag/vimtex",
    enabled = is_linux,
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "zathura"
    end,
  },
}
