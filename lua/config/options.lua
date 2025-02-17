-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
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
