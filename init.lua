
local opt = vim.opt

opt.backup = false
opt.clipboard:append("unnamedplus")
opt.cmdheight = 2
opt.completeopt = {"menuone", "noselect"}
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
  "lewis6991/gitsigns.nvim", 
  config = function()
    require("gitsigns").setup()
    end
  },




  {"nvim-lualine/lualine.nvim", 
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
      require("lualine").setup()
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
        require("telescope").setup{
          pickers = {
            find_files = {theme = "dropdown"},
            registers = {theme = "cursor"},
            buffers = {theme = "ivy"}
          }

        }
      end

    },





{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
},
{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }

})


keymap.set("n", "<A-t>", "<cmd>NvimTreeToggle<CR>")
local builtin = require('telescope.builtin')
keymap.set('n', '<A-h>', builtin.oldfiles, {})
keymap.set('n', '<A-b>', builtin.buffers, {})
keymap.set('n', '<A-p>', builtin.registers, {})
keymap.set('n', '<A-f>', builtin.find_files, {})
