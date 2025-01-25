return {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-emoji",
  },
  -- Not all LSP servers add brackets when completing a function.
  -- To better deal with this, LazyVim adds a custom option to cmp,
  -- that you can configure. For example:
  --
  -- ```lua
  -- opts = {
  --   auto_brackets = { "python" }
  -- }
  -- ```
  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()
    local auto_select = true
    return {
      auto_brackets = { "python" }, -- configure any filetype to auto add brackets
      completion = {
        completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
      },
      preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<tab>"] = LazyVim.cmp.confirm({ select = auto_select }),
        -- ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
        ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
        ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
          return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
        end,
        -- ["<C-CR>"] = function(fallback)
        --   cmp.abort()
        --   fallback()
        -- end,
        -- ["<tab>"] = function(fallback)
        --   return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
        -- end,
      }),
      sources = cmp.config.sources({
        { name = "lazydev" },
        { name = "nvim_lsp" },
        { name = "path" },
      }, {
        { name = "buffer" },
      }),
      formatting = {
        format = function(entry, item)
          local icons = LazyVim.config.icons.kinds
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end

          local widths = {
            abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
            menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
          }

          for key, width in pairs(widths) do
            if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
              item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
            end
          end

          return item
        end,
      },
      experimental = {
        -- only show ghost text when we show ai completions
        ghost_text = vim.g.ai_cmp and {
          hl_group = "CmpGhostText",
        } or false,
      },
      sorting = defaults.sorting,
    }
  end,
  main = "lazyvim.util.cmp",
}
-- return {
--   "hrsh7th/nvim-cmp",
--   -- Not all LSP servers add brackets when completing a function.
--   -- To better deal with this, LazyVim adds a custom option to cmp,
--   -- that you can configure. For example:
--   --
--   -- ```lua
--   -- opts = {
--   --   auto_brackets = { "python" }
--   -- }
--   -- ```
--   opts = function()
--     local cmp = require("cmp")
--     local auto_select = true
--     return {
--       mapping = cmp.mapping.preset.insert({
--         ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
--         ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--         ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--         ["<tab>"] = LazyVim.cmp.confirm({ select = auto_select }),
--         ["<CR>"] = function(fallback)
--           return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
--         end,
--       }),
--       auto_brackets = { "python" },
--     }
--   end,
-- }
-- return {
--   {
--     "L3MON4D3/LuaSnip",
--     keys = function()
--       return {}
--     end,
--   },
--   -- then: setup supertab in cmp
--   {
--     "hrsh7th/nvim-cmp",
--     dependencies = {
--       "hrsh7th/cmp-emoji",
--     },
--     ---@param opts cmp.ConfigSchema
--     opts = function(_, opts)
--       local has_words_before = function()
--         unpack = unpack or table.unpack
--         local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--         return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
--       end

--       local luasnip = require("luasnip")
--       local cmp = require("cmp")

--       table.insert(opts.sources, 1, {
--         name = "copilot",
--         group_index = 2,
--         priority = -1000000,
--       })
--       opts.mapping = vim.tbl_extend("force", opts.mapping, {
--         -- ["<CR>"] = cmp.config.disable,
--         -- ["<Tab>"] = cmp.mapping.confirm({ select = true }),
--         ["<CR>"] = cmp.mapping.confirm({
--           behavior = cmp.ConfirmBehavior.Replace,
--           select = true,
--         }),
--         ["<C-j>"] = cmp.mapping.select_next_item(),
--         ["<C-k>"] = cmp.mapping.select_prev_item(),
--         ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
--         ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
--         ["<C-Space>"] = cmp.mapping.complete(),
--         --["<C-j>"] = cmp.mapping(function(fallback) end, { "i", "s" }),
--       })
--     end,
--   },
-- }

-- {
--   "L3MON4D3/LuaSnip",
--   keys = function()
--     return {}
--   end,
-- },
-- -- then: setup supertab in cmp
-- {
--   "hrsh7th/nvim-cmp",
--   dependencies = {
--     "hrsh7th/cmp-emoji",
--   },
--   ---@param opts cmp.ConfigSchema
--   opts = function(_, opts)
--     local has_words_before = function()
--       unpack = unpack or table.unpack
--       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
--     end

--     local luasnip = require("luasnip")
--     local cmp = require("cmp")

--     opts.mapping = vim.tbl_extend("force", opts.mapping, {
--       ["<CR>"] = cmp.config.disable,
--       ["<Tab>"] = cmp.mapping.confirm({ select = true }),
--       ["<C-j>"] = cmp.mapping(function(fallback) end, { "i", "s" }),
--     })
--   end,
-- },
