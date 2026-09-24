require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "svelte",
  "ts_ls",
  "cssls",
  "rust_analyzer",
  "ruff",
  -- "jedi_language_server",
  -- "clangd",
  -- "pyrefly",
  "qmlls",
  "pyment",
  "pyright",
  "texlab",
  "ltex_lus",
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

vim.lsp.config.ltex_plus = {
  settings = {
    ltex = {
      language = "auto", -- detecta español e inglés solo
      filetypes = { "tex", "markdown", "text" },
    },
  },
}

vim.lsp.enable(servers)
