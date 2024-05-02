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
-- local cmp = require("cmp")
-- local has_words_before = function()
--   if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
--     return false
--   end
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
-- end
-- cmp.setup({
--   mapping = {
--     ["<Tab>"] = vim.schedule_wrap(function(fallback)
--       if cmp.visible() and has_words_before() then
--         cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
--       else
--         fallback()
--       end
--     end),
--   },
-- })
