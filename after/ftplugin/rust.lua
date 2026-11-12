local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set('n', '<leader>a', function()
  vim.cmd.RustLsp 'codeAction' -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })
vim.keymap.set(
  'n',
  'K', -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function() vim.cmd.RustLsp { 'hover', 'actions' } end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set('x', '<leader>d', '<esc>`>a)<esc>`<idbg!(<esc>B')
vim.keymap.set('n', '<leader>D', '/dbg!(<CR>dt(mz%x`zx')

local which_key = require 'which-key'
local m = vim.keymap
local prefix = '<leader>r'
which_key.add {
  { prefix, group = 'rust' }, --add the group to which-key
}
local function rustlsp(cmd) vim.cmd.RustLsp(cmd) end
m.set({ 'n' }, prefix .. 'r', function() rustlsp 'run' end, { desc = 'run at cursor' })
m.set({ 'n' }, prefix .. 'r', function() rustlsp 'runnables' end, { desc = 'runnables' })
m.set({ 'n' }, prefix .. 'e', function() rustlsp { 'expandMacro', 'float' } end, { desc = 'inspect macro expansion' })
m.set({ 'n' }, prefix .. 'E', function() rustlsp 'expandMacro' end, { desc = 'expand macro in separate buffer' })
m.set({ 'n' }, prefix .. 'm', function() rustlsp { 'moveItem', 'up' } end, { desc = 'move up' })
m.set({ 'n' }, prefix .. 'M', function() rustlsp { 'moveItem', 'down' } end, { desc = 'move down' })
m.set({ 'n' }, prefix .. 'c', function() rustlsp { 'openCargo' } end, { desc = 'open Cargo.toml' })
m.set({ 'n' }, prefix .. 'd', function() rustlsp { 'openDocs' } end, { desc = 'open docs for symbol' })
m.set({ 'n', 'x' }, 'J', function() rustlsp { 'joinLines' } end, { desc = 'join lines' })
