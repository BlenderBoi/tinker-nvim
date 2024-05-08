
local opt = vim.opt

opt.backup = false
opt.clipboard:append("unnamedplus")
opt.cmdheight = 2
opt.completeopt = { "menuone", "noselect" }
opt.conceallevel = 0
opt.fileencoding = "utf-8"
opt.hlsearch = true
opt.ignorecase = true
opt.mouse = "a"
opt.pumheight = 10
opt.showmode = false
opt.showtabline = 2
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.timeoutlen = 300
opt.undofile = true
opt.updatetime = 300
opt.writebackup = false
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.cursorline = true
opt.number = true
opt.relativenumber = false
opt.numberwidth = 4
opt.signcolumn = "yes"
opt.wrap = false
opt.linebreak = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.guifont = "monospace:h17"
opt.whichwrap = "bs<>[]hl"
opt.autoindent = true
opt.termguicolors = true
opt.background = "dark"
-- opt.backspace = "indent,eol,start"


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


local keymap = vim.keymap


local opts = {noremap = true, silent = true}

keymap.set("v", "<", "<gv^", opts)
keymap.set("v", ">", ">gv^", opts)

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap.set("n", "<S-l>", ":bnext<CR>", opts)
keymap.set("n", "<S-h>", ":bprevious<CR>", opts)



local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)






require("lazy").setup({


{"0x00-ketsu/maximizer.nvim",
  config = function()
    require("maximizer").setup()
 
  end},


  {
  "folke/tokyonight.nvim", 
  priotiy = 1000,
  lazy = false,
  opts={},
  config = function()
    require("tokyonight").setup()
    vim.cmd[[colorscheme tokyonight]]
    

    end
  },
{
  'stevearc/dressing.nvim',
  opts = {},
},

{"nvim-treesitter/nvim-treesitter", build=":TSUpdate", dependencies={"windwp/nvim-ts-autotag"}, 
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
},

{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons',
config = function()
  require("bufferline").setup(
  {
        options = {

        offsets={{

          filetype="NvimTree",
          text="Nvim Tree",
          highlight = "Directory"
        }

        }
        }

      }
  )
end

},


    {"stevearc/conform.nvim", 
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
    end},

  {"nvim-lualine/lualine.nvim", 
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
      require("lualine").setup({


      })
    end

  },
  {"numToStr/Comment.nvim", opts={}, lazy=false, config=function() require("Comment").setup() end},

  {"nvim-tree/nvim-tree.lua", dependencies = "nvim-tree/nvim-web-devicons", 
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
    })





  end
  },

    {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
	require("telescope").setup({
		pickers = {
			find_files = { theme = "dropdown" },
			registers = { theme = "cursor" },
			buffers = { theme = "ivy" },
		},
	})
      end

    

    },

    {
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


    },


{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
},
    

-- {
--     'windwp/nvim-autopairs',
--     event = "InsertEnter",
--     dependencies = {"hrsh7th/nvim-cmp"},
--     config = function()
--       local autopairs = require("nvim-autopairs")
--       local cmp_autopairs = require("nvim-autopairs.completion.cmp")
--       local cmp = require("cmp")
--       cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
--     end
--     -- use opts = {} for passing setup options
--     -- this is equalent to setup({}) function
-- },
--
{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },





{"williamboman/mason.nvim", dependencies={"williamboman/mason-lspconfig.nvim"},
config=function()
	local mason = require("mason")
	mason.setup()
end
},


{"neovim/nvim-lspconfig", dependencies={"hrsh7th/cmp-nvim-lsp", {"antosha417/nvim-lsp-file-operations", config=true}, {"folke/neodev.nvim", opts={}}}
, config = function() 
	local lspconfig = require("lspconfig")
	local mason_lspconfig = require("mason-lspconfig")
	mason_lspconfig.setup()
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local capabilities = cmp_nvim_lsp.default_capabilities()
	mason_lspconfig.setup_handlers({
		function(server_name)
			lspconfig[server_name].setup({ capabilities = capabilities })
		end,
	})
end},



})

keymap.set("n", "<A-t>", "<cmd>NvimTreeToggle<CR>")
local builtin = require("telescope.builtin")
keymap.set("n", "<A-h>", builtin.oldfiles, {})
keymap.set("n", "<A-b>", builtin.buffers, {})
keymap.set("n", "<A-p>", builtin.registers, {})
keymap.set("n", "<A-f>", builtin.find_files, {})

vim.api.nvim_set_keymap('n', '<A-m>', '<cmd>lua require("maximizer").toggle()<CR>', {silent = true, noremap = true})
