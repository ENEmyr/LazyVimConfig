-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remove default lazyvim keymap
-- vim.keymap.del("n", "<leader>w-")
-- vim.keymap.del("n", "<leader>w|")
-- vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<c-k>")

-- Set vim keymap
-- vim.keymap.set("v", "<leader>/", "gc")

-- Which-key keymaps
local wk = require("which-key")
wk.add({
  { "<leader>/", desc = "Toggle Comment" },
  { "<leader>bf", "<cmd>Telescope buffers<cr>", desc = "Find" },
  { "<leader>bj", "<cmd>BufferLinePick<CR>", desc = "Jump" },
  { "<leader>d", group = "debug" },
  { "<leader>m", group = "Molten - Running Code Like Notebook File" },
  { "<leader>mI", "<cmd>MoltenDeinit<CR>", desc = "De-initialize the current buffer" },
  { "<leader>mN", "<cmd>MoltenNext<CR>", desc = "Go to next code cell" },
  { "<leader>mR", "<cmd>MoltenRestart<CR>", desc = "Restart kernel" },
  { "<leader>mb", "<cmd>MoltenInterrupt<CR>", desc = "Interrupt currently running code" },
  { "<leader>me", ":noautocmd MoltenEnterOutput<CR>", desc = "Move into output window" },
  { "<leader>mh", "<cmd>MoltenHideOutput<CR>", desc = "Hide currently open output window" },
  { "<leader>mi", "<cmd>MoltenInit<CR>", desc = "Initialize a kernel for current buffer" },
  { "<leader>ml", "<cmd>MoltenEvaluateLine<CR>", desc = "Run current line" },
  { "<leader>mm", "<cmd>MoltenImagePopup<CR>", desc = "Popup current output's image" },
  { "<leader>mn", "<cmd>MoltenNext<CR>", desc = "Go to next code cell" },
  { "<leader>mo", "<cmd>MoltenEvaluateOperator<CR>", desc = "Run operator selection (like run on 3j)" },
  { "<leader>mp", "<cmd>MoltenPrev<CR>", desc = "Go to prev code cell" },
  { "<leader>mr", "<cmd>MoltenReevaluateCell<CR>", desc = "Re-run the active cell" },
  { "<leader>ms", "<cmd>MoltenShowOutput<CR>", desc = "Shows active cell output's window" },
  { "<leader>o", group = "OverSeer" },
  { "<leader>oa", "<cmd>OverseerQuickAction<CR>", desc = "Quick Action" },
  { "<leader>ob", "<cmd>OverseerBuild<CR>", desc = "Build" },
  { "<leader>oc", "<cmd>OverseerRunCmd<CR>", desc = "Run Command" },
  { "<leader>od", "<cmd>OverseerDeleteBundle<CR>", desc = "Delete Bundle" },
  { "<leader>ol", "<cmd>OverseerLoadBundle<CR>", desc = "Load Bundle" },
  { "<leader>or", "<cmd>OverseerRun<CR>", desc = "Run" },
  { "<leader>os", "<cmd>OverseerSaveBundle<CR>", desc = "Save Bundle" },
  { "<leader>ot", "<cmd>OverseerToggle<CR>", desc = "Toggle" },
  { "<leader>p", group = "Pane" },
  { "<leader>pd", "<cmd>q<CR>", desc = "Close" },
  { "<leader>ph", "<cmd>sp<CR>", desc = "Horizontal Split" },
  { "<leader>pv", "<cmd>vsp<CR>", desc = "Vertical Split" },
  { "<leader>uU", "<cmd>UndotreeToggle<CR>", desc = "Undotree" },
  { "<leader>uo", "<cmd>Outline<CR>", desc = "Code Structure tree" },
  { "<leader>w", group = "Hop" },
  { "<leader>wh", "<cmd>HopWordCurrentLineBC<CR>", desc = "Word Before Cursor" },
  { "<leader>wl", "<cmd>HopWordCurrentLineAC<CR>", desc = "Word After Cursor" },
  { "<leader>ws", "<cmd>HopChar2<CR>", desc = "Search 2 Chars" },
  { "<leader>ww", "<cmd>HopWord<CR>", desc = "Word" },
  { "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv", desc = "Run visual selection", mode = "v" },
})
-- wk.register({
--   ["/"] = "Toggle Comment",
--   o = {
--     name = "OverSeer",
--     b = { "<cmd>OverseerBuild<CR>", "Build" },
--     t = { "<cmd>OverseerToggle<CR>", "Toggle" },
--     a = { "<cmd>OverseerQuickAction<CR>", "Quick Action" },
--     s = { "<cmd>OverseerSaveBundle<CR>", "Save Bundle" },
--     l = { "<cmd>OverseerLoadBundle<CR>", "Load Bundle" },
--     d = { "<cmd>OverseerDeleteBundle<CR>", "Delete Bundle" },
--     r = { "<cmd>OverseerRun<CR>", "Run" },
--     c = { "<cmd>OverseerRunCmd<CR>", "Run Command" },
--   },
--   w = {
--     name = "Hop",
--     w = { "<cmd>HopWord<CR>", "Word" },
--     h = { "<cmd>HopWordCurrentLineBC<CR>", "Word Before Cursor" },
--     l = { "<cmd>HopWordCurrentLineAC<CR>", "Word After Cursor" },
--     s = { "<cmd>HopChar2<CR>", "Search 2 Chars" },
--   },
--   p = {
--     name = "Pane",
--     v = { "<cmd>vsp<CR>", "Vertical Split" },
--     h = { "<cmd>sp<CR>", "Horizontal Split" },
--     d = { "<cmd>q<CR>", "Close" },
--   },
--   u = {
--     o = { "<cmd>Outline<CR>", "Code Structure tree" },
--     U = { "<cmd>UndotreeToggle<CR>", "Undotree" },
--   },
--   m = {
--     name = "Molten - Running Code Like Notebook File",
--     i = { "<cmd>MoltenInit<CR>", "Initialize a kernel for current buffer" },
--     I = { "<cmd>MoltenDeinit<CR>", "De-initialize the current buffer" },
--     n = { "<cmd>MoltenNext<CR>", "Go to next code cell" },
--     N = { "<cmd>MoltenNext<CR>", "Go to next code cell" },
--     p = { "<cmd>MoltenPrev<CR>", "Go to prev code cell" },
--     l = { "<cmd>MoltenEvaluateLine<CR>", "Run current line" },
--     v = { ":<C-u>MoltenEvaluateVisual<CR>gv", "Run visual selection", mode = "v" },
--     o = { "<cmd>MoltenEvaluateOperator<CR>", "Run operator selection (like run on 3j)" },
--     r = { "<cmd>MoltenReevaluateCell<CR>", "Re-run the active cell" },
--     s = { "<cmd>MoltenShowOutput<CR>", "Shows active cell output's window" },
--     h = { "<cmd>MoltenHideOutput<CR>", "Hide currently open output window" },
--     e = { ":noautocmd MoltenEnterOutput<CR>", "Move into output window" },
--     b = { "<cmd>MoltenInterrupt<CR>", "Interrupt currently running code" },
--     m = { "<cmd>MoltenImagePopup<CR>", "Popup current output's image" },
--     R = { "<cmd>MoltenRestart<CR>", "Restart kernel" },
--   },
--   b = {
--     j = { "<cmd>BufferLinePick<CR>", "Jump" },
--     f = { "<cmd>Telescope buffers<cr>", "Find" },
--   },
--   d = { name = "+debug" },
-- }, { prefix = "<leader>" })
