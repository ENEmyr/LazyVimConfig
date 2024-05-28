-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remove default lazyvim keymap
vim.keymap.del("n", "<leader>w-")
vim.keymap.del("n", "<leader>w|")
vim.keymap.del("n", "<leader>wd")

-- Set vim keymap
-- vim.keymap.set("v", "<leader>/", "gc")

-- Which-key keymaps
local wk = require("which-key")
wk.register({
  ["/"] = "Toggle Comment",
  o = {
    name = "OverSeer",
    b = { "<cmd>OverseerBuild<CR>", "Build" },
    t = { "<cmd>OverseerToggle<CR>", "Toggle" },
    a = { "<cmd>OverseerQuickAction<CR>", "Quick Action" },
    s = { "<cmd>OverseerSaveBundle<CR>", "Save Bundle" },
    l = { "<cmd>OverseerLoadBundle<CR>", "Load Bundle" },
    d = { "<cmd>OverseerDeleteBundle<CR>", "Delete Bundle" },
    r = { "<cmd>OverseerRun<CR>", "Run" },
    c = { "<cmd>OverseerRunCmd<CR>", "Run Command" },
  },
  w = {
    name = "Hop",
    w = { "<cmd>HopWord<CR>", "Word" },
    h = { "<cmd>HopWordCurrentLineBC<CR>", "Word Before Cursor" },
    l = { "<cmd>HopWordCurrentLineAC<CR>", "Word After Cursor" },
    s = { "<cmd>HopChar2<CR>", "Search 2 Chars" },
  },
  p = {
    name = "Pane",
    v = { "<cmd>vsp<CR>", "Vertical Split" },
    h = { "<cmd>sp<CR>", "Horizontal Split" },
    d = { "<cmd>q<CR>", "Close" },
  },
  u = {
    o = { "<cmd>Outline<CR>", "Code Structure tree" },
    U = { "<cmd>UndotreeToggle<CR>", "Undotree" },
  },
  m = {
    name = "Molten - Running Code Like Notebook File",
    i = { "<cmd>MoltenInit<CR>", "Initialize a kernel for current buffer" },
    I = { "<cmd>MoltenDeinit<CR>", "De-initialize the current buffer" },
    n = { "<cmd>MoltenNext<CR>", "Go to next code cell" },
    N = { "<cmd>MoltenNext<CR>", "Go to next code cell" },
    p = { "<cmd>MoltenPrev<CR>", "Go to prev code cell" },
    l = { "<cmd>MoltenEvaluateLine<CR>", "Run current line" },
    v = { ":<C-u>MoltenEvaluateVisual<CR>gv", "Run visual selection", mode = "v" },
    o = { "<cmd>MoltenEvaluateOperator<CR>", "Run operator selection (like run on 3j)" },
    r = { "<cmd>MoltenReevaluateCell<CR>", "Re-run the active cell" },
    s = { "<cmd>MoltenShowOutput<CR>", "Shows active cell output's window" },
    h = { "<cmd>MoltenHideOutput<CR>", "Hide currently open output window" },
    e = { ":noautocmd MoltenEnterOutput<CR>", "Move into output window" },
    b = { "<cmd>MoltenInterrupt<CR>", "Interrupt currently running code" },
    m = { "<cmd>MoltenImagePopup<CR>", "Popup current output's image" },
    R = { "<cmd>MoltenRestart<CR>", "Restart kernel" },
  },
  b = {
    j = { "<cmd>BufferLinePick<CR>", "Jump" },
    f = { "<cmd>Telescope buffers<cr>", "Find" },
  },
  d = { name = "+debug" },
}, { prefix = "<leader>" })
