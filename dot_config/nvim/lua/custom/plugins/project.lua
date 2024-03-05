-- vim: ts=2 sts=2 sw=2 et
-- project.lua
--

return {
	"ahmedkhalf/project.nvim",
	depenedencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("project_nvim").setup({
			exclude_dirs = {
				"~/.local/*",
			},
		})

		require("telescope").load_extension("projects")
		vim.keymap.set("n", "<leader>sp", "<cmd>Telescope projects<cr>", { desc = "[S]earch [P]rojects" })
	end,
}
