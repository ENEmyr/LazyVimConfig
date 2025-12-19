-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- =============================================================================
-- Which-key Keymaps
-- =============================================================================
local wk = require("which-key")
wk.add({
  -- Comment Toggle
  { "<leader>\\", "<cmd>CommentToggle<CR>", desc = "Toggle Comment" },

  -- AI/OpenCode
  { "<leader>at", group = "Toggle OpenCode" },

  -- Buffers
  { "<leader>bf", "<cmd>Telescope buffers<cr>", desc = "Find" },
  { "<leader>bj", "<cmd>BufferLinePick<CR>", desc = "Jump" },

  -- Debug
  { "<leader>d", group = "debug" },

  -- Molten - Running Code Like Notebook
  { "<leader>m", group = "Molten" },
  { "<leader>mi", "<cmd>MoltenInit<CR>", desc = "Initialize kernel" },
  { "<leader>mI", "<cmd>MoltenDeinit<CR>", desc = "De-initialize buffer" },
  { "<leader>ml", "<cmd>MoltenEvaluateLine<CR>", desc = "Run current line" },
  { "<leader>mr", "<cmd>MoltenReevaluateCell<CR>", desc = "Re-run active cell" },
  { "<leader>mR", "<cmd>MoltenRestart<CR>", desc = "Restart kernel" },
  { "<leader>mb", "<cmd>MoltenInterrupt<CR>", desc = "Interrupt running code" },
  { "<leader>mo", "<cmd>MoltenEvaluateOperator<CR>", desc = "Run operator selection" },
  { "<leader>mn", "<cmd>MoltenNext<CR>", desc = "Next code cell" },
  { "<leader>mN", "<cmd>MoltenNext<CR>", desc = "Next code cell" },
  { "<leader>mp", "<cmd>MoltenPrev<CR>", desc = "Prev code cell" },
  { "<leader>me", ":noautocmd MoltenEnterOutput<CR>", desc = "Enter output window" },
  { "<leader>mh", "<cmd>MoltenHideOutput<CR>", desc = "Hide output window" },
  { "<leader>ms", "<cmd>MoltenShowOutput<CR>", desc = "Show output window" },
  { "<leader>mm", "<cmd>MoltenImagePopup<CR>", desc = "Popup image" },
  { "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv", desc = "Run visual selection", mode = "v" },

  -- Overseer
  { "<leader>o", group = "OverSeer" },
  { "<leader>or", "<cmd>OverseerRun<CR>", desc = "Run" },
  { "<leader>ot", "<cmd>OverseerToggle<CR>", desc = "Toggle" },
  { "<leader>oa", "<cmd>OverseerQuickAction<CR>", desc = "Quick Action" },
  { "<leader>ob", "<cmd>OverseerBuild<CR>", desc = "Build" },
  { "<leader>oc", "<cmd>OverseerRunCmd<CR>", desc = "Run Command" },
  { "<leader>ol", "<cmd>OverseerLoadBundle<CR>", desc = "Load Bundle" },
  { "<leader>os", "<cmd>OverseerSaveBundle<CR>", desc = "Save Bundle" },
  { "<leader>od", "<cmd>OverseerDeleteBundle<CR>", desc = "Delete Bundle" },

  -- Pane Management
  { "<leader>p", group = "Pane" },
  { "<leader>pv", "<cmd>vsp<CR>", desc = "Vertical Split" },
  { "<leader>ph", "<cmd>sp<CR>", desc = "Horizontal Split" },
  { "<leader>pd", "<cmd>q<CR>", desc = "Close" },

  -- UI Toggles
  { "<leader>uU", "<cmd>UndotreeToggle<CR>", desc = "Undotree" },
  { "<leader>uo", "<cmd>Outline<CR>", desc = "Code Structure tree" },

  -- Hop (Quick Navigation)
  { "<leader>w", group = "Hop" },
  { "<leader>ww", "<cmd>HopWord<CR>", desc = "Word" },
  { "<leader>wl", "<cmd>HopWordCurrentLineAC<CR>", desc = "Word After Cursor" },
  { "<leader>wh", "<cmd>HopWordCurrentLineBC<CR>", desc = "Word Before Cursor" },
  { "<leader>ws", "<cmd>HopChar2<CR>", desc = "Search 2 Chars" },
})

-- =============================================================================
-- Thai Keyboard Mappings (Kedmanee layout)
-- =============================================================================
-- Maps Thai characters to their corresponding English keys for normal mode navigation
local thai_mappings = {
  -- Numbers row
  { "ๅ", "1" }, { "ภ", "4" }, { "ถ", "5" }, { "ุ", "6" }, { "ึ", "7" },
  { "ค", "8" }, { "ต", "9" }, { "จ", "0" }, { "ข", "-" }, { "ช", "=" },

  -- Shift + Numbers
  { "%", "~" }, { "๑", "@" }, { "๒", "#" }, { "๓", "$" }, { "๔", "%" },
  { "ู", "^" }, { "฿", "&" }, { "๕", "*" }, { "๖", "(" }, { "๗", ")" },
  { "๘", "_" }, { "๙", "+" },

  -- QWERTY row
  { "ๆ", "q" }, { "ไ", "w" }, { "ำ", "e" }, { "พ", "r" }, { "ะ", "t" },
  { "ั", "y" }, { "ี", "u" }, { "ร", "i" }, { "น", "o" }, { "ย", "p" },
  { "บ", "[" }, { "ล", "]" },

  -- ASDF row
  { "ฟ", "a" }, { "ห", "s" }, { "ก", "d" }, { "ด", "f" }, { "เ", "g" },
  { "้", "h" }, { "่", "j" }, { "า", "k" }, { "ส", "l" }, { "ว", ";" }, { "ง", "'" },

  -- ZXCV row
  { "ผ", "z" }, { "ป", "x" }, { "แ", "c" }, { "อ", "v" }, { "ิ", "b" },
  { "ื", "n" }, { "ท", "m" }, { "ม", "," }, { "ใ", "." }, { "ฝ", "/" },

  -- Shift + QWERTY row
  { "๐", "Q" }, { "ฎ", "E" }, { "ฑ", "R" }, { "ธ", "T" }, { "ํ", "Y" },
  { "๊", "U" }, { "ณ", "I" }, { "ฯ", "O" }, { "ญ", "P" }, { "ฐ", "{" },

  -- Shift + ASDF row
  { "ฤ", "A" }, { "ฆ", "S" }, { "ฏ", "D" }, { "โ", "F" }, { "ฌ", "G" },
  { "็", "H" }, { "๋", "J" }, { "ษ", "K" }, { "ศ", "L" }, { "ซ", ":" },

  -- Shift + ZXCV row
  { "ฉ", "C" }, { "ฮ", "V" }, { "ฺ", "B" }, { "์", "N" }, { "ฒ", "<" },
  { "ฬ", ">" }, { "ฦ", "?" },
}

-- Apply Thai mappings
for _, m in ipairs(thai_mappings) do
  map("n", m[1], m[2], { noremap = true })
end

-- Special multi-character mappings
map("n", "เเ", "gg", { noremap = true }) -- Thai double 'e' -> go to top

-- Scrolling mappings
map("n", "ผผ", "zz", { noremap = true }) -- Center cursor
map("n", "ผะ", "zt", { noremap = true }) -- Cursor to top
map("n", "ผิ", "zb", { noremap = true }) -- Cursor to bottom

-- Ctrl + Thai keys for scrolling
map("n", "<C-ี>", "<C-u>", { noremap = true }) -- Page up
map("n", "<C-ก>", "<C-d>", { noremap = true }) -- Page down
