return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Ensure mason installs the server
      clangd = {
        keys = {
          { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
        },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(
            "Makefile",
            "configure.ac",
            "configure.in",
            "config.h.in",
            "meson.build",
            "meson_options.txt",
            "build.ninja"
          )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
            fname
          ) or require("lspconfig.util").find_git_ancestor(fname)
        end,
        capabilities = {
          offsetEncoding = { "utf-16" },
        },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
      },
      pyright = {
        enabled = true,
        -- pyright = {
        --   autoImportCompletions = true,
        --   reportUnknownVariableType = false,
        --   reportUnusedImport = false,
        --   disableOrganizeImports = true,
        -- },
        settings = {
          python = {
            analysis = {
              ignore = { "*" },
              -- typeCheckingMode = "standard",
              typeCheckingMode = "basic",
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true,
              autoSearchPaths = true,
            },
          },
        },
        keys = {
          { "<leader>co", "<cmd>PyrightOrganizeImports<cr>", desc = "Organize Imports" },
        },
      },
      basedpyright = {
        enabled = false,
        settings = {
          autoImportCompletions = true,
          reportUnknownVariableType = false,
          reportUnusedImport = false,
          disableOrganizeImports = true,
          basedpyright = {
            analysis = {
              ignore = { "*" },
              -- typeCheckingMode = "basic",
              typeCheckingMode = "off",
              -- diagnosticMode = "workspace",
              useLibraryCodeForTypes = true,
              autoSearchPaths = true,
            },
          },
        },
        keys = {
          { "<leader>co", "<cmd>PyrightOrganizeImports<cr>", desc = "Organize Imports" },
        },
      },
      ruff = {
        enabled = true,
        settings = {
          -- Ruff-specific settings
          ruff = {
            organizeImports = true, -- Auto-organize imports
            lint = {
              enabled = true, -- Enable linting
              ignore = {}, -- You can specify ignored rules here
            },
            format = { enabled = true }, -- Enable autoformatting
          },
        },
      },
      texlab = {
        enabled = true,
        settings = {
          texlab = {
            build = {
              -- executable = "sh",
              -- args = { "-c", "latexmk -xelatex -interaction=nonstopmode -cd && latexmk -c" },
              executable = "latexmk",
              args = { "-xelatex", "-cd", "-interaction=nonstopmode" },
              -- args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
              onSave = false,
              forwardSearchAfter = false,
            },
            chktex = { -- Run chktex linting
              onEdit = true,
              onOpenAndSave = true,
            },
            forwardSearch = {
              executable = "zathura",
              args = { "--synctex-forward", "%l:1:%f", "%p" },
            },
            formatterLineLength = 80,
            latexFormatter = "latexindent",
            latexindent = {
              modifyLineBreaks = true,
            },
          },
        },
      },
    },
    setup = {
      clangd = function(_, opts)
        local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
        require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
        return false
      end,
    },
  },
}
