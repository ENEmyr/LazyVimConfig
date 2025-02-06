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

if vim.fn.filereadable(vim.fn.getcwd() .. "/project.godot") == 1 then
  local addr = "./godot.pipe"
  if vim.fn.has("win32") == 1 then
    addr = "127.0.0.1:6004"
  end
  vim.fn.serverstart(addr)
end
-- local godot_projectfile = vim.fn.getcwd() .. "/project.godot"
-- if godot_projectfile then
--   vim.fn.serverstart("./godothost")
-- end

-- Auto-run command before quitting when working on LaTeX files
local function before_quit_tex()
  if vim.bo.filetype == "tex" or vim.bo.filetype == "bib" then
    -- Replace this with the command you want to run before quitting
    vim.cmd(":VimtexClean")
  end
end

-- Set up autocmd to trigger before quitting
vim.api.nvim_create_autocmd("QuitPre", {
  callback = before_quit_tex,
  desc = "Auto-run :VimtexClean before quitting LaTeX files",
})
