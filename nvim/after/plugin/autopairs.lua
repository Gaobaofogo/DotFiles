local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

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
