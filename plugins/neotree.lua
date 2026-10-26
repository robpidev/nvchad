return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "folke/snacks.nvim",
  },
  -- cmd leader + e or ctrl + n
  -- keys = { "<leader>e", "<C-n>" },
  -- event = "VeryLazy",
  config = function()
    require "configs.neo-tree"
  end,
  lazy = false,
}
