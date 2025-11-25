require('mason').setup({})
require('mason-lspconfig').setup({
  automatic_enable = true,
  ensure_installed = {
      "clangd",
      "lua_ls",
      "ansiblels",
      "bashls",
      "cmake",
      "clojure_lsp",
      "dockerls",
      "docker_compose_language_service",
      "jsonls",
      "ltex",
      "autotools_ls",
      "marksman",
      "pyright",
      "rust_analyzer",
      "taplo",
      "hydra_lsp"
  }
})
