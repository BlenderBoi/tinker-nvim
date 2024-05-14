return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = { "windwp/nvim-ts-autotag", "HiPhish/rainbow-delimiters.nvim" },
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			highlight = { enable = true, additional_vim_regex_highlighting = false },
			indent = { enable = true },
			autotag = { enable = true },
			ensure_installed = { "lua", "python", "svelte", "javascript", "html", "javascript", "bash", "json" },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-]>",
					node_incremental = "<C-]>",
					scope_incremental = false,
					node_decremental = "<C-[>",
					-- node_decremental = "<bs>",
				},
			},
		})
	end,
}
