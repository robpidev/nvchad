local neo = require "neo-tree"

neo.setup {
  source_selector = {
    winbar = true,
    -- statusline = true,
    show_file = true,
    show_bufnr = true,
    show_current = true,
  },
  window = {
    --   position = "left",
    -- width = 30,
  },
  filesystem = {
    follow_current_file = {
      enabled = true,
    },
  },
  popup_border_style = "rounded",
  default_component_configs = {
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
    },
  },
}
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "neo-tree",
--   callback = function()
--     vim.opt_local.winbar = ""
--     vim.opt_local.winhighlight = "Normal:NeoTreeNormal"
--   end,
-- })
