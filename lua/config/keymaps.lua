-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remove default lazyvim keymap
-- vim.keymap.del("n", "<leader>w-")
-- vim.keymap.del("n", "<leader>w|")
-- vim.keymap.del("n", "<leader>wd")

-- Set vim keymap
-- vim.keymap.set("v","<leader>mv" , ":<C-u>MoltenEvaluateVisual<CR>gv")

-- Which-key keymaps
local wk = require("which-key")
wk.add({
  { "<leader>\\", "<cmd>CommentToggle<CR>", desc = "Toggle Comment" },

  { "<leader>at", group = "Toggle OpenCode" },
  -- { "<leader>a", group = "Copilot" },
  -- { "<leader>at", "<cmd>CopilotChatToggle<CR>", desc = "Chat Toggle" },
  -- { "<leader>ar", "<cmd>CopilotChatReset<CR>", desc = "Reset Chat" },
  -- {
  --   "<leader>aa",
  --   expand = function()
  --     local actions = require("CopilotChat.actions")
  --     require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
  --   end,
  --   desc = "Prompt Actions",
  --   mode = { "n", "v" },
  -- },
  -- {
  --   "<leader>aq",
  --   expand = function()
  --     local input = vim.fn.input("Quick Chat: ")
  --     if input ~= "" then
  --       require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  --     end
  --   end,
  --   desc = "Quick Chat",
  --   mode = { "n", "v" },
  -- },

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
  { "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv", desc = "Run visual selection", mode = "v" },

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

-- mapping for thai keys

-- Assumes kedmanee key bindings, for now.
-- Pull requests welcome for more mappings ; - )

-- keys that are already mapped are the keys that Vim use by default (because
-- they are available in English keyboard). So we shouldn't remap it to something
-- else without user's acknowledgement
-- ___________________________
--                KEY MAPPINGS
-- :map \- ` " already mapped
vim.api.nvim_set_keymap("n", "ๅ", "1", { noremap = true })
-- :map / 2 " already mapped
-- :map _ 3 " already mapped
vim.api.nvim_set_keymap("n", "ภ", "4", { noremap = true })
vim.api.nvim_set_keymap("n", "ถ", "5", { noremap = true })
vim.api.nvim_set_keymap("n", "ุ", "6", { noremap = true })
vim.api.nvim_set_keymap("n", "ึ", "7", { noremap = true })
vim.api.nvim_set_keymap("n", "ค", "8", { noremap = true })
vim.api.nvim_set_keymap("n", "ต", "9", { noremap = true })
vim.api.nvim_set_keymap("n", "จ", "0", { noremap = true })
vim.api.nvim_set_keymap("n", "ข", "-", { noremap = true })
vim.api.nvim_set_keymap("n", "ช", "=", { noremap = true })

vim.api.nvim_set_keymap("n", "%", "~", { noremap = true })
-- :map \+ ! " already mapped
vim.api.nvim_set_keymap("n", "๑", "@", { noremap = true })
vim.api.nvim_set_keymap("n", "๒", "#", { noremap = true })
vim.api.nvim_set_keymap("n", "๓", "$", { noremap = true })
vim.api.nvim_set_keymap("n", "๔", "%", { noremap = true })
vim.api.nvim_set_keymap("n", "ู", "^", { noremap = true })
vim.api.nvim_set_keymap("n", "฿", "&", { noremap = true })
vim.api.nvim_set_keymap("n", "๕", "*", { noremap = true })
vim.api.nvim_set_keymap("n", "๖", "(", { noremap = true })
vim.api.nvim_set_keymap("n", "๗", ")", { noremap = true })
vim.api.nvim_set_keymap("n", "๘", "_", { noremap = true })
vim.api.nvim_set_keymap("n", "๙", "+", { noremap = true })

vim.api.nvim_set_keymap("n", "ๆ", "q", { noremap = true })
vim.api.nvim_set_keymap("n", "ไ", "w", { noremap = true })
vim.api.nvim_set_keymap("n", "ำ", "e", { noremap = true })
vim.api.nvim_set_keymap("n", "พ", "r", { noremap = true })
vim.api.nvim_set_keymap("n", "ะ", "t", { noremap = true })
vim.api.nvim_set_keymap("n", "ั", "y", { noremap = true })
vim.api.nvim_set_keymap("n", "ี", "u", { noremap = true })
vim.api.nvim_set_keymap("n", "ร", "i", { noremap = true })
vim.api.nvim_set_keymap("n", "น", "o", { noremap = true })
vim.api.nvim_set_keymap("n", "ย", "p", { noremap = true })
vim.api.nvim_set_keymap("n", "บ", "[", { noremap = true })
vim.api.nvim_set_keymap("n", "ล", "]", { noremap = true })
vim.api.nvim_set_keymap("n", "ฟ", "a", { noremap = true })
vim.api.nvim_set_keymap("n", "ห", "s", { noremap = true })
vim.api.nvim_set_keymap("n", "ก", "d", { noremap = true })
vim.api.nvim_set_keymap("n", "ด", "f", { noremap = true })
vim.api.nvim_set_keymap("n", "เ", "g", { noremap = true })
vim.api.nvim_set_keymap("n", "เเ", "gg", { noremap = true })
vim.api.nvim_set_keymap("n", "้", "h", { noremap = true })
vim.api.nvim_set_keymap("n", "่", "j", { noremap = true })
vim.api.nvim_set_keymap("n", "า", "k", { noremap = true })
vim.api.nvim_set_keymap("n", "ส", "l", { noremap = true })
vim.api.nvim_set_keymap("n", "ว", ";", { noremap = true })
vim.api.nvim_set_keymap("n", "ง", "'", { noremap = true })
vim.api.nvim_set_keymap("n", "ผ", "z", { noremap = true })
vim.api.nvim_set_keymap("n", "ป", "x", { noremap = true })
vim.api.nvim_set_keymap("n", "แ", "c", { noremap = true })
vim.api.nvim_set_keymap("n", "อ", "v", { noremap = true })
vim.api.nvim_set_keymap("n", "ิ", "b", { noremap = true })
vim.api.nvim_set_keymap("n", "ื", "n", { noremap = true })
vim.api.nvim_set_keymap("n", "ท", "m", { noremap = true })
vim.api.nvim_set_keymap("n", "ม", ",", { noremap = true })
vim.api.nvim_set_keymap("n", "ใ", ".", { noremap = true })
vim.api.nvim_set_keymap("n", "ฝ", "/", { noremap = true })

vim.api.nvim_set_keymap("n", "๐", "Q", { noremap = true })
-- :map \" W "key already mapped
vim.api.nvim_set_keymap("n", "ฎ", "E", { noremap = true })
vim.api.nvim_set_keymap("n", "ฑ", "R", { noremap = true })
vim.api.nvim_set_keymap("n", "ธ", "T", { noremap = true })
vim.api.nvim_set_keymap("n", "ํ", "Y", { noremap = true })
vim.api.nvim_set_keymap("n", "๊", "U", { noremap = true })
vim.api.nvim_set_keymap("n", "ณ", "I", { noremap = true })
vim.api.nvim_set_keymap("n", "ฯ", "O", { noremap = true })
vim.api.nvim_set_keymap("n", "ญ", "P", { noremap = true })
vim.api.nvim_set_keymap("n", "ฐ", "{", { noremap = true })
-- :map , \} " already mapped
-- :map ฅ | " no mapping found
vim.api.nvim_set_keymap("n", "ฤ", "A", { noremap = true })
vim.api.nvim_set_keymap("n", "ฆ", "S", { noremap = true })
vim.api.nvim_set_keymap("n", "ฏ", "D", { noremap = true })
vim.api.nvim_set_keymap("n", "โ", "F", { noremap = true })
vim.api.nvim_set_keymap("n", "ฌ", "G", { noremap = true })
vim.api.nvim_set_keymap("n", "็", "H", { noremap = true })
vim.api.nvim_set_keymap("n", "๋", "J", { noremap = true })
vim.api.nvim_set_keymap("n", "ษ", "K", { noremap = true })
vim.api.nvim_set_keymap("n", "ศ", "L", { noremap = true })
vim.api.nvim_set_keymap("n", "ซ", ":", { noremap = true })
-- :map \. \" " key already mapped
-- :map \( Z " key already mapped
-- :map \) X " key already mapped
vim.api.nvim_set_keymap("n", "ฉ", "C", { noremap = true })
vim.api.nvim_set_keymap("n", "ฮ", "V", { noremap = true })
vim.api.nvim_set_keymap("n", "ฺ", "B", { noremap = true })
vim.api.nvim_set_keymap("n", "์", "N", { noremap = true })
-- :map ? M " key already mapped
vim.api.nvim_set_keymap("n", "ฒ", "<", { noremap = true })
vim.api.nvim_set_keymap("n", "ฬ", ">", { noremap = true })
vim.api.nvim_set_keymap("n", "ฦ", "?", { noremap = true })

-- Scrolling relative to cursor
-- For help, type :help scroll-cursor
vim.api.nvim_set_keymap("n", "ผผ", "zz", { noremap = true })
vim.api.nvim_set_keymap("n", "ผะ", "zt", { noremap = true })
vim.api.nvim_set_keymap("n", "ผิ", "zb", { noremap = true })

vim.api.nvim_set_keymap("n", "<c-ี>", "<c-u>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-ก>", "<c-d>", { noremap = true })
-- TODO: fix these line to make it work
-- vim.api.nvim_set_keymap("n", "<s-้>", "<s-h>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<s-ส>", "<s-l>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<c-้>", "<c-h>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<c-ส>", "<c-l>", { noremap = true })
