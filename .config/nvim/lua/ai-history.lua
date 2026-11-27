local source = {}

function source.new(opts)
	local self = setmetatable({}, { __index = source })
	self.opts = opts
	return self
end

function source:get_completions(ctx, callback)
	local history = require("snacks.picker.util.history").new("ai").kv.data
	local items = {}
	for _, text in pairs(history) do
		-- if string.sub(text, 1, string.len(ctx.bounds.line)) == ctx.bounds.line then
		--           text = string.sub(text, string.len(ctx.bounds.line) + 1)
		--           vim.notify(vim.inspect(text))
			local item = {
				label = text,
                -- filterText = 'readme',
			}
			table.insert(items, item)
		-- end
	end

	callback({
		items = items,
	})

	return function() end
end

return source
