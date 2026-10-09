local which_key = require 'which-key'
local m = vim.keymap

local function map_group(group, modes, prefix, buttons)
  which_key.add {
    { prefix, group = group }, --add the group to which-key
  }
  for _, button in pairs(buttons) do
    m.set(modes, prefix .. button.key, button.func, button.opts)
  end
end

--Basic command modficiations
m.set('n', 'Y', 'y$', { desc = 'Yank to eol' })
m.set({ 'n', 'x' }, 'x', '"_x') -- delete without copy
m.set({ 'n', 'x' }, 'X', '"_X') -- delete without copy

-- Center screen when jumping
m.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
m.set('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })
m.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })
m.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })

-- Better indenting in visual mode
m.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
m.set('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- Better J behavior
m.set('n', 'J', 'mzJ`z', { desc = 'Join lines and keep cursor position' })

m.set({ 'n', 'x' }, ']e', function() vim.diagnostic.jump { severity = 1, count = vim.v.count1 } end, { remap = true })
m.set({ 'n', 'x' }, '[e', function() vim.diagnostic.jump { severity = 1, count = -vim.v.count1 } end, { remap = true })
m.set({ 'n', 'x' }, ']w', function() vim.diagnostic.jump { severity = 2, count = vim.v.count1 } end, { remap = true })
m.set({ 'n', 'x' }, '[w', function() vim.diagnostic.jump { severity = 2, count = -vim.v.count1 } end, { remap = true })

m.set({ 'n', 'x' }, 'ä', ']', { remap = true })
m.set({ 'n', 'x' }, 'Ä', '[', { remap = true })

--<C-BS>
m.set('i', '<C-BS>', '<C-o>vb"_d')

--:norm shortcut
m.set({ 'n', 'x' }, '<C-b>', ':norm ')
m.set('i', '<C-BS>', '<C-o>vb"_d')

--redo
m.set('n', 'r', '<C-r>')

m.set({ 'n', 'x' }, 'j', 'h')
m.set({ 'n', 'x' }, 'k', 'j')
m.set({ 'n', 'x' }, 'l', 'k')
m.set({ 'n', 'x' }, 'ö', 'l')
