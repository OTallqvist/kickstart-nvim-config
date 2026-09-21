Mappings_on = false
Mappings = {
  { 't', 'j' },
  { 'n', 'k' },
  { 's', 'l' },
  { 'j', 't' },
  { 'k', 'n' },
  { 'l', 's' },
}

function Mappings_enable()
  Mappings_on = true
  for i, mapping in pairs(Mappings) do
    vim.keymap.set({ 'n', 'x', 'o' }, mapping[1], mapping[2], { remap = true })
    local mapping_upper = { string.upper(mapping[1]), string.upper(mapping[2]) }
    vim.keymap.set({ 'n', 'x', 'o' }, mapping_upper[1], mapping_upper[2], { remap = true })
    local mapping_ctrl = { string.format('<C-%s>', mapping[1]), string.format('<C-%s>', mapping[2]) }
    vim.keymap.set({ 'n', 'x', 'o' }, mapping_ctrl[1], mapping_ctrl[2], { remap = true })
  end
end

function Mappings_disable()
  Mappings_on = false
  for i, mapping in pairs(Mappings) do
    vim.keymap.del({ 'n', 'x', 'o' }, mapping[1])
    mapping = { mapping[1].upper, mapping[2].upper }
  end
end

function Mappings_toggle()
  if Mappings_on then
    Mappings_disable()
  else
    Mappings_enable()
  end
end

vim.keymap.set({ 'n', 'x' }, 'å', Mappings_toggle)
