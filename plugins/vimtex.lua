return {
  {
    "lervag/vimtex",
    ft = { "tex" },
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_syntax_enabled = 1
      vim.g.vimtex_syntax_conceal_disable = 0

      vim.g.vimtex_syntax_conceal = {
        accents = 1,
        cites = 1,
        fancy = 1,
        greek = 1,
        math_bounds = 0,
        math_delimiters = 0,
        math_fracs = 1,
        math_super_sub = 1,
        math_symbols = 1,
        sections = 0,
        styles = 1,
      }
    end,
  },

  {
    "sonv/latex-preview.nvim",
    dependencies = {
      { "folke/snacks.nvim", opts = { image = { enabled = true } } },
    },
    ft = { "tex", "latex", "markdown", "rmd", "quarto" },
    opts = {
      setup_keymap = true,           -- <leader>ih: inspect here
      hover = { auto_open = false }, -- open previews with the keymap
      cache = true,                  -- reuse saved-buffer renders across sessions
      cache_dir = "aux",             -- <buffer-directory>/aux/latex-preview-cache/
      render = { font_size = 8 },
      references = {
        enable = true,
      },
    },
  },
}
