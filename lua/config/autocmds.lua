-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- =============================================================================
-- Linewise Paste Fix
-- Problem: when using clipboard=unnamedplus, yy+p may paste inline instead of on new line
-- Solution: Track regtype during yank and apply it during paste
-- =============================================================================
vim.g._last_yank_regtype = "v"

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("linewise_paste_fix", { clear = true }),
  callback = function()
    local event = vim.v.event
    if event.regname == "" or event.regname == "+" then
      vim.g._last_yank_regtype = event.regtype
    end
  end,
})

-- Custom paste that respects linewise yank
local function paste_with_regtype(key)
  return function()
    local clipboard_content = vim.fn.getreg("+")
    local regtype = vim.fn.getregtype("+")
    if regtype == "v" and vim.g._last_yank_regtype == "V" then
      vim.fn.setreg("+", clipboard_content, "V")
    end
    return key
  end
end

vim.keymap.set("n", "p", paste_with_regtype("p"), { expr = true, desc = "Paste (respects linewise)" })
vim.keymap.set("n", "P", paste_with_regtype("P"), { expr = true, desc = "Paste before (respects linewise)" })

-- =============================================================================
-- Python/Molten Keymaps (filetype-specific)
-- =============================================================================
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("python_molten_keymaps", { clear = true }),
  pattern = "python",
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("v", "<C-S-l>", ":<C-u>MoltenEvaluateVisual<CR>gv", opts)
    vim.keymap.set("n", "<C-S-j>", "<cmd>MoltenNext<CR>", opts)
    vim.keymap.set("n", "<C-S-k>", "<cmd>MoltenPrev<CR>", opts)
    vim.keymap.set("n", "<C-S-l>", "<cmd>MoltenEvaluateLine<CR>", opts)
    vim.keymap.set("n", "<C-x>", "<cmd>JupyniumExecuteSelectedCells<CR>", opts)
    vim.keymap.set("n", "<C-S-x>", "<cmd>JupyniumClearSelectedCellsOutputs<CR>", opts)
  end,
})

-- =============================================================================
-- LaTeX Auto-compile
-- =============================================================================
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("latex_autocompile", { clear = true }),
  pattern = "*.tex",
  callback = function()
    local root = vim.fn.findfile("main.tex", ".;") or vim.fn.findfile(".latexmkrc", ".;")
    if root == "" then
      vim.notify("No main.tex or .latexmkrc found. Skipping compilation.", vim.log.levels.INFO)
      return
    end
    local root_dir = vim.fn.fnamemodify(root, ":h")

    vim.fn.jobstart("latexmk -xelatex -cd -interaction=nonstopmode", {
      cwd = root_dir,
      on_exit = function(_, exit_code)
        if exit_code == 0 then
          vim.fn.jobstart("latexmk -c", { cwd = root_dir })
        else
          vim.notify("LaTeX compilation failed. Skipping cleanup.", vim.log.levels.WARN)
        end
      end,
    })
  end,
})

-- =============================================================================
-- NvimTree Session Restore
-- =============================================================================
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("nvimtree_session_restore", { clear = true }),
  pattern = "NvimTree*",
  callback = function()
    local ok, api = pcall(require, "nvim-tree.api")
    if not ok then
      return
    end
    local view = require("nvim-tree.view")
    if not view.is_visible() then
      api.tree.open()
    end
  end,
})
