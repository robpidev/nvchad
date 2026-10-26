return {

  { import = "nvchad.blink.lazyspec" },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },

  -- animation identation
  {
    "echasnovski/mini.indentscope",
    event = "BufReadPre",
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
  },

  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    config = function()
      require("supermaven-nvim").setup {
        keymaps = {
          accept_suggestion = "<A-CR>",
          clear_suggestion = "<A-Delete>",
          accept_word = "<CR-Space>",
        },
      }
    end,
  },

  -- todo-coments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPost",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  -- Emogi
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     "hrsh7th/cmp-emoji",
  --   },
  --   opts = require "configs.cmp",
  -- },

  -- Semar cursor
  -- {
  --   "sphamba/smear-cursor.nvim",
  --   opts = {
  --     cursor_color = "#BA68C8",
  --     trailing_stiffness = 0.5,
  --     stiffness = 0.8,
  --     distance_stop_animating = 1,
  --   },
  --   event = "VeryLazy",
  -- },

  -- Multicursor
  -- {
  --   "mg979/vim-visual-multi",
  --   event = "BufEnter",
  -- },
  --

  -- Menu

  { "nvzone/volt", lazy = true },
  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
  },
}
