local plugins = {
  { 'files', opts = {} },
  { 'tabline', opts = {} },
}

for _, spec in ipairs(plugins) do
  spec[1] = 'mini.' .. spec[1]
  spec.virtual = true
end

return plugins
