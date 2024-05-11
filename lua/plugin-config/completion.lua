
local kind_icons = {
  Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
  Field = " ",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
  Snippet = "",
	Color = "󰏘",
	File = "󰈙",
  Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
  Struct = "",
	Event = "",
	Operator = "󰆕",
  TypeParameter = " ",
	Misc = " ",
}


    return {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      {"L3MON4D3/LuaSnip", version="v2.*", build = "make install_jsregexp"},
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
      "chrisgrieser/cmp-nerdfont",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-nvim-lua",
      "amarakon/nvim-cmp-fonts",
      "roginfarrer/cmp-css-variables"



      },
      config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({paths={"~/.config/nvim/snippets/bpy-snippets"}})
        cmp.setup({
          completion = {
            completeopt = "menu,menuone,preview,noselect",
          },
          snippet = {
            expand = function(args)
		luasnip.lsp_expand(args.body)
            end,

          },
      sources = cmp.config.sources({
        {name="nvim_lsp"},
        {name="nvim_lua"},
        {name="luasnip"},
        {name="buffer"},
        {name="path"},
        {name="calc"},
        {name="css-variables"},
        {name= "fonts", option = { space_filter = "-" } },
        {name="nerdfont"}
      }),
      -- formatting = {
      --   format = lspkind.cmp_format({
      --      -- mode = "symbol",
      --      maxwidth=50, 
      --      ellipsis_char = "...",
      --      show_labelDetails = true,
      --    })},
      --
      

      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
          -- Kind icons
          -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      },








 mapping = {

    -- ... Your other mappings ...
   ['<CR>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            if luasnip.expandable() then
                luasnip.expand()
            else
                cmp.confirm({
                    select = true,
                })
            end
        else
            fallback()
        end
    end),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif luasnip.locally_jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
    end, { "i", "s" }),

    -- ... Your other mappings ...
  },

        
  })
        
    
      end


    }
