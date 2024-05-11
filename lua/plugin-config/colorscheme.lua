
  return {
  "folke/tokyonight.nvim", 
  priotiy = 1000,
  lazy = false,
  opts={},
  config = function()
    require("tokyonight").setup()
    vim.cmd[[colorscheme tokyonight]]
    

    end
  }
