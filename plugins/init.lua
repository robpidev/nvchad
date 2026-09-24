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

  {
    'Thiago4532/mdmath.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      filetypes = { 'markdown' },
      foreground = 'Normal',
      anticonceal = true,
      hide_on_insert = true,
      dynamic = true,
      dynamic_scale = 1.0,
      update_interval = 400,
      internal_scale = 1.0,
    },
  },

  -- flash
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },

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


  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<A-CR>",
          clear_suggestion = "<A-Delete>",
          accept_word = "<CR-Space>",
        },
      })
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

  -- Neotree
  {
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

  -- Markdown preview
  {
    "OXY2DEV/markview.nvim",
    ft = { "markdown" },
    opts = {
      latex = {
        enabled = false,
      }
    }
  },

  -- LaTex
  {
    "lervag/vimtex",
    ft = { "tex" },
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_syntax_conceal_disable = 0 -- Mostrar símbolos bonitos
      -- Personalizar qué se oculta/embellece
      vim.g.vimtex_syntax_conceal = {
        accents = 1,
        cites = 1,
        fancy = 1,
        greek = 1,
        math_bounds = 0,
        math_delimiters = 1,
        math_fracs = 1,
        math_super_sub = 1,
        math_symbols = 1,
        sections = 0,
        styles = 1,
      }
    end,
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
  --

  -- Menu

  { "nvzone/volt",                   lazy = true },
  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
  },
}
