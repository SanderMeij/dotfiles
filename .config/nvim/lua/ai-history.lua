local source = {}

function source.new(opts)
  local self = setmetatable({}, { __index = source })
  self.opts = opts
  return self
end

function source:get_completions(_, callback)
  local history = require("snacks.picker.util.history").new("ai").kv.data
  local items = {}
  for _, text in pairs(history) do
    local item = {
      label = text,
    }
    table.insert(items, item)
  end

  callback({
    items = items,
  })

  return function() end
end

return source
