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

  -- color delimiters
  {
    "nvim-treesitter/nvim-treesitter",
    -- opts = overrides.treesitter,
    dependencies = {
      -- bracket colorizer
      "HiPhish/rainbow-delimiters.nvim",
      config = function()
        require "configs.rainbow"
      end,
    },
  },

  -- codium
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
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

  -- Neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require "configs.neo-tree"
    end,
    -- lazy = false,
  },

  -- nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvim-tree",
  },

  -- Dap-ui
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
    -- keys = { "<leader>du" },
    dependencies = {
      {
        "mfussenegger/nvim-dap",
        config = function()
          require "configs.nvim-dap"
        end,
      },
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
    },
  },

  -- color picker
  {
    "uga-rosa/ccc.nvim",
    keys = { "<leader>p" },
    cmd = "CccPick",
    -- lazy = false,
    -- ft = { "html", "css", "scss", "svelte" },
    config = function()
      require("ccc").setup()
    end,
  },

  -- Markdown preview
  {
    "OXY2DEV/markview.nvim",
    ft = { "markdown" },
  },

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
}
