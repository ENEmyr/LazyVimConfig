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
      vim.keymap.set("n", "<C-S-l>", ":MoltenEvaluateLine<CR>")
      vim.keymap.set("n", "<C-x>", ":JupyniumExecuteSelectedCells<CR>")
      vim.keymap.set("n", "<C-S-x>", ":JupyniumClearSelectedCellsOutputs<CR>")
    end)
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.tex",
  callback = function()
    local root = vim.fn.findfile("main.tex", ".;") or vim.fn.findfile(".latexmkrc", ".;")
    if root == "" then
      print("No main.tex or .latexmkrc found. Skipping compilation.")
      return
    end
    local root_dir = vim.fn.fnamemodify(root, ":h")

    -- Compile the whole project
    vim.fn.jobstart("latexmk -xelatex -cd -interaction=nonstopmode", {
      cwd = root_dir,
      on_exit = function(_, exit_code)
        if exit_code == 0 then
          -- Run cleanup only if compilation was successful
          vim.fn.jobstart("latexmk -c", { cwd = root_dir })
        else
          print("Compilation failed. Skipping cleanup.")
        end
      end,
    })
  end,
})

-- restore nvim-tree with auto-session
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "NvimTree*",
  callback = function()
    local api = require("nvim-tree.api")
    local view = require("nvim-tree.view")

    if not view.is_visible() then
      api.tree.open()
    end
  end,
})
