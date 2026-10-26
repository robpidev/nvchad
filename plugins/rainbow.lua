return {
  "nvim-treesitter/nvim-treesitter",
  -- opts = overrides.treesitter,
  dependencies = {
    -- bracket colorizer
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require "configs.rainbow"
    end,
  },
}
