return {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    indent_width = 2,
    indent_markers = {
      enable = true,
      icons = {
        item = "├",
      },
    },
    icons = {
      padding = " ",
      webdev_colors = true,
      modified_placement = "after",
      git_placement = "after",
      show = {
        folder_arrow = false,
        git = true,
      },
      symlink_arrow = " ➛ ",
      glyphs = {
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
        },
      },
    },
  },
}
