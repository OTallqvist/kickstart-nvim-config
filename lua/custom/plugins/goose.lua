vim.filetype.add { extension = { goose = 'goose' } }
vim.lsp.config('goose', {
  cmd = { 'goose', 'lsp' },
  filetypes = { 'goose' },
  root_markers = { '.git' },
  -- init_options = { entryFiles = { '/path/to/project/main.goose' } },
})
vim.lsp.enable 'goose'
