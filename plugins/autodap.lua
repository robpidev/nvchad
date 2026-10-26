return {
  "JarnDev/autodap.nvim",
  keys = {
    {
      "<F5>",
      function()
        require("autodap").continue()
      end,
      desc = "Debug: start/continue (autodap)",
    },
  },
  config = function()
    require("autodap").setup { ui = false }
  end,
}
