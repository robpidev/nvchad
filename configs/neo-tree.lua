local neo = require "neo-tree"

neo.setup {
  window = {
    --   position = "left",
    width = 30,
  },
  filesystem = {
    follow_current_file = true,
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
