return {
  "nvim-lualine/lualine.nvim",
  optional = true,
  event = "VeryLazy",
  opts = function(_, opts)
    local colors = {
      [""] = { fg = Snacks.util.color("Special") },
      ["Normal"] = { fg = Snacks.util.color("Special") },
      ["Warning"] = { fg = Snacks.util.color("DiagnosticError") },
      ["InProgress"] = { fg = Snacks.util.color("DiagnosticWarn") },
    }
    table.insert(opts.sections.lualine_x, 2, {
      function()
        local icon = require("lazyvim.config").icons.kinds.Copilot
        local status = require("copilot.api").status.data
        return icon .. (status.message or "")
      end,
      cond = function()
        if not package.loaded["copilot"] then
          return
        end
        local ok, clients = pcall(LazyVim.lsp.get_clients, { name = "copilot", bufnr = 0 })
        if not ok then
          return false
        end
        return ok and #clients > 0
      end,
      color = function()
        if not package.loaded["copilot"] then
          return
        end
        local status = require("copilot.api").status.data
        return colors[status.status] or colors[""]
      end,
    })
    table.insert(opts.sections.lualine_c, {
      function()
        return require("nvim-navic").get_location()
      end,
      cond = function()
        return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
      end,
    })
  end,
}
