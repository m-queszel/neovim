return {
  'nvim-mini/mini.nvim',
  version = '*',
  config = function()
    local gen_loader = require('mini.snippets').gen_loader

    require('mini.files').setup {}
    require('mini.icons').setup {}
    require('mini.snippets').setup({
      snippets = {
        -- Load custom file with global snippets first (adjust for Windows)
        gen_loader.from_file('~/.config/nvim/snippets/global.json'),
        gen_loader.from_lang(),
      },
    })
    require('mini.pairs').setup {}
  end,
}
