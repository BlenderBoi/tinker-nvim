require("plugin-config.plugin-manager")

require("lazy").setup({

	require("plugin-config.maximizer"),
	require("plugin-config.colorscheme"),
	require("plugin-config.dressing"),
	require("plugin-config.treesitter"),
	require("plugin-config.bufferline"),
	require("plugin-config.formatting"),
	require("plugin-config.lualine"),
	require("plugin-config.comment"),
	require("plugin-config.nvim-tree"),
	require("plugin-config.autopairs"),
	require("plugin-config.telescope"),
	require("plugin-config.indent-blankline"),
	require("plugin-config.mason"),
	require("plugin-config.lsp"),
	require("plugin-config.completion"),
	require("plugin-config.gitsigns"),
	require("plugin-config.fugitive"),
	require("plugin-config.colorizer"),
	require("plugin-config.tmux"),
})
