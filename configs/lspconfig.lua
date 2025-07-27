require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "svelte",
  "ts_ls",
  "cssls",
  "rust_analyzer",
  -- "ruff",
  -- "pyrefly",
  "pyment",
  "pyright",
}

-- read :h vim.lsp.config for changing options of lsp servers
-- Add inlay_hints all servers
-- create on_attach function

vim.lsp.config.pyright = {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        -- extraPaths = { "./" },
        autoImportCompletions = true,
        autoSearchPaths = true,
        -- diagnosticMode = "workspace",
        --
      },
    },
  },
}

vim.lsp.enable(servers)
