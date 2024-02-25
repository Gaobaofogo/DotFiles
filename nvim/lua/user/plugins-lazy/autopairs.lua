return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
		config = function()
			local npairs = require("nvim-autopairs")
			-- change default fast_wrap
			npairs.setup({
				fast_wrap = {
					map = "<M-e>",
					chars = { "{", "[", "(", '"', "'" },
					pattern = [=[[%'%"%>%]%)%}%,]]=],
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
					manual_position = true,
					highlight = "Search",
					highlight_grey = "Comment",
				},
			})
		end,
	},
}
