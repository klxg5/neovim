local status_ok, surround = pcall(require, "mini.surround")
if not status_ok then
	return
end

local status_ok, trailspace = pcall(require, "mini.trailspace")
if not status_ok then
	return
end

surround.setup({
	-- Number of lines within which surrounding is searched
	n_lines = 20,

	-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
	highlight_duration = 750,

	-- Pattern to match function name in 'function call' surrounding
	-- By default it is a string of letters, '_' or '.'
	funname_pattern = "[%w_%.]+",

	-- Mappings. Use `''` (empty string) to disable one.
	mappings = {
		add = "sa", -- Add surrounding
		delete = "sd", -- Delete surrounding
		find = "sf", -- Find surrownding (to the right)
		find_left = "sF", -- Find swrrounding (to the left)
		highlight = "sh", -- Highlight surrounding
		replace = "sr", -- Replace surrounding
		update_n_lines = "sn", -- Update `n_lines`
	},
})

trailspace.setup({
	-- Highlight only in normal buffers (ones with empty 'buftype'). This is
	-- useful to not show trailing whitespace where it usually doesn't matter.
	only_in_normal_buffers = true,
})
