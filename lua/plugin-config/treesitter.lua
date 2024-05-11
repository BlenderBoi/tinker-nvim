
return {"nvim-treesitter/nvim-treesitter", build=":TSUpdate", dependencies={"windwp/nvim-ts-autotag"}, 
config =  function()
  local treesitter = require("nvim-treesitter.configs")
  treesitter.setup({
    highlight = {enable = true},
    indent = {enable = true},
    autotag = {enable = true},
    ensure_installed = {"lua", "python"},
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-]>",
        node_incremental= "<C-]>",
        scope_incremental = false,
        node_decremental = "<bs>"

      }

    }

  })
end
}
