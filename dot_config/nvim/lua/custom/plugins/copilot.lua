-- vim: ts=2 sts=2 sw=2 et
-- copliot.lua
--
-- Setup GitHub Copliot

return {
	"zbirenbaum/copilot.lua",
	dependencies = {
		{
			"zbirenbaum/copilot-cmp",
			config = function()
				require("copilot_cmp").setup()
			end,
		},
	},
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
	end,
}
