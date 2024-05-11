
    return {"stevearc/conform.nvim", 
    config=function() 
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          javascript = {"prettier"},
          typescript = {"prettier"},
          svelte = {"prettier"},
          css = {"prettier"},
          html = {"prettier"},
          json = {"prettier"},
          yaml = {"prettier"},
          markdown = {"prettier"},
          lua = {"stylua"},
          python = {"isort", "black"}

        },

        vim.keymap.set({"n", "v"}, "<A-w>",
        function()
            conform.format()

        end)

      })
    end}

