return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			pickers = {
				find_files = { theme = "dropdown" },
				registers = { theme = "cursor" },
				buffers = { theme = "ivy" },
			},
		})
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<A-h>", builtin.oldfiles, {})
		vim.keymap.set("n", "<A-b>", builtin.buffers, {})
		vim.keymap.set("n", "<A-p>", builtin.registers, {})
		vim.keymap.set("n", "<A-f>", builtin.find_files, {})
		vim.keymap.set("n", "<A-g>", builtin.live_grep, {})
	end,
}
