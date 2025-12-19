-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local alpha = function()
  return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
end

vim.g.neovide_profiler = false
vim.g.neovide_scale_factor = 0.8
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_refresh_rate = 144
vim.g.neovide_cursor_vfx_mode = "wireframe"
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.g.neovide_window_blurred = true
vim.g.neovide_input_macos_alt_is_meta = false
vim.g.neovide_input_use_logo = true
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_remember_window_size = true
vim.g.neovide_transparency = 0.95
vim.g.transparency = 0.95
vim.g.neovide_background_color = "#0f1117" .. alpha()
vim.o.guifont = "CaskaydiaCove Nerd Font:h14"

vim.g.pydocstring_doq_path = "/home/enemy/miniconda3/bin/doq"
vim.g.pydocstring_enable_mapping = 0

vim.g.root_lsp_ignore = { "copilot" }
vim.g.ai_cmp = false

-- Fix linewise paste from system clipboard
-- Problem: when using clipboard=unnamedplus, yy+p may paste inline instead of on new line
-- Solution: Track regtype during yank and apply it during paste
vim.g._last_yank_regtype = "v"

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    local event = vim.v.event
    if event.regname == "" or event.regname == "+" then
      vim.g._last_yank_regtype = event.regtype
    end
  end,
})

-- Custom paste that respects linewise yank
vim.keymap.set("n", "p", function()
  local clipboard_content = vim.fn.getreg("+")
  local regtype = vim.fn.getregtype("+")
  -- If regtype is charwise but we yanked linewise, force linewise paste
  if regtype == "v" and vim.g._last_yank_regtype == "V" then
    vim.fn.setreg("+", clipboard_content, "V")
  end
  return "p"
end, { expr = true, desc = "Paste (respects linewise)" })

vim.keymap.set("n", "P", function()
  local clipboard_content = vim.fn.getreg("+")
  local regtype = vim.fn.getregtype("+")
  if regtype == "v" and vim.g._last_yank_regtype == "V" then
    vim.fn.setreg("+", clipboard_content, "V")
  end
  return "P"
end, { expr = true, desc = "Paste before (respects linewise)" })

-- -- Set text width for automatic line wrapping
-- vim.opt.textwidth = 80
-- -- Enable breaking long lines while preserving logical structure
-- vim.opt.linebreak = true
-- -- Soft wrapping (prevents breaking words in the middle)
-- vim.opt.wrap = true
-- -- Enable auto-wrapping at textwidth
-- vim.opt.formatoptions:append("t")
-- -- Enable `gq` formatting (paragraph reflow)
-- vim.opt.formatoptions:append("a")
