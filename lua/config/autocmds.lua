-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Keymaps for molten specific only to Python filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.schedule(function()
      -- vim.keymap.set("n", "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv")
      vim.keymap.set("v", "<C-S-l>", ":<C-u>MoltenEvaluateVisual<CR>gv")
      vim.keymap.set("n", "<C-S-j>", ":MoltenNext<CR>")
      vim.keymap.set("n", "<C-S-k>", ":MoltenPrev<CR>")
      vim.keymap.set("n", "<C-S-l>", ":MoltenEvaluateLine<CR>")
    end)
  end,
})
