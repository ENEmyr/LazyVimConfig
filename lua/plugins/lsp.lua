return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- Get vue-language-server path from mason
    local vue_language_server_path = vim.fn.stdpath("data")
      .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

    local vue_plugin = {
      name = "@vue/typescript-plugin",
      location = vue_language_server_path,
      languages = { "vue" },
      configNamespace = "typescript",
    }

    opts.servers = opts.servers or {}
    opts.setup = opts.setup or {}

    -- TypeScript/JavaScript with Vue plugin
    opts.servers.vtsls = {
      enabled = true,
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      settings = {
        typescript = {
          updateImportsOnFileMove = { enabled = "always" },
        },
        javascript = {
          updateImportsOnFileMove = { enabled = "always" },
        },
        vtsls = {
          enableMoveToFileCodeAction = true,
          tsserver = {
            globalPlugins = {
              vue_plugin,
            },
          },
        },
      },
    }

    -- Vue language server
    opts.servers.vue_ls = {
      enabled = true,
    }

    -- Disable volar (replaced by vue_ls)
    opts.servers.volar = { enabled = false }

    -- C/C++
    opts.servers.clangd = {
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
        )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(fname)
          or require("lspconfig.util").find_git_ancestor(fname)
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
    }

    -- Python
    opts.servers.pyright = {
      enabled = true,
      settings = {
        python = {
          analysis = {
            ignore = { "*" },
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
    }

    opts.servers.basedpyright = {
      enabled = false,
      settings = {
        autoImportCompletions = true,
        reportUnknownVariableType = false,
        reportUnusedImport = false,
        disableOrganizeImports = true,
        basedpyright = {
          analysis = {
            ignore = { "*" },
            typeCheckingMode = "off",
            useLibraryCodeForTypes = true,
            autoSearchPaths = true,
          },
        },
      },
      keys = {
        { "<leader>co", "<cmd>PyrightOrganizeImports<cr>", desc = "Organize Imports" },
      },
    }

    opts.servers.ruff = {
      enabled = true,
      settings = {
        ruff = {
          organizeImports = true,
          lint = {
            enabled = true,
            ignore = {},
          },
          format = { enabled = true },
        },
      },
    }

    -- LaTeX
    opts.servers.texlab = {
      enabled = true,
      settings = {
        texlab = {
          build = {
            executable = "latexmk",
            args = { "-xelatex", "-cd", "-interaction=nonstopmode" },
            onSave = false,
            forwardSearchAfter = false,
          },
          chktex = {
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
    }

    -- Setup handlers
    opts.setup.clangd = function(_, server_opts)
      local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
      require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = server_opts }))
      return false
    end
  end,
}
