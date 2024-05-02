return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  build = ":MasonUpdate",
  opts = {
    ensure_installed = {
      "stylua",
      "shfmt",
      "flake8",
      "pyright",
      "arduino-language-server",
      "bash-debug-adapter",
      "bash-language-server",
      "black",
      "clang-format",
      "clangd",
      "cmake-language-server",
      "cmakelang",
      "css-lsp",
      "debugpy",
      "dockerfile-language-server",
      "emmet-ls",
      "eslint-lsp",
      "eslint_d",
      "htmlbeautifier",
      "jq",
      "json-lsp",
      "jsonlint",
      "julia-lsp",
      "lua-language-server",
      "markdownlint",
      "nginx-language-server",
      "omnisharp-mono",
      "prettier",
      "pydocstyle",
      "shellcheck",
      "sql-formatter",
      "sqlls",
      "svelte-language-server",
      "tailwindcss-language-server",
      "vim-language-server",
      "vue-language-server",
      "xmlformatter",
      "yaml-language-server",
      "yamlfmt",
      "yamllint",
    },
  },
}