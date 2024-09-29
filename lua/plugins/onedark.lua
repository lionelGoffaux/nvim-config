return {
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    name = "onedarkpro",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "onedark"
    end
  }
}
