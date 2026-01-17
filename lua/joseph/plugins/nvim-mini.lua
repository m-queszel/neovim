return {
  'nvim-mini/mini.nvim',
  version = '*',
  config = function()
    local gen_loader = require('mini.snippets').gen_loader
    require('mini.icons').setup {}
    require('mini.snippets').setup({
      snippets = {
        -- Load custom file with global snippets first (adjust for Windows)
        gen_loader.from_file('~/.config/nvim/snippets/global.json'),
        gen_loader.from_lang(),
      },
    })
    require('mini.pairs').setup {}
    require('mini.completion').setup {}
    require('mini.comment').setup {}
    require('mini.splitjoin').setup {}
    require('mini.surround').setup {}
    require('mini.ai').setup {}
    require('mini.indentscope').setup {}
    require('mini.tabline').setup {}
    require('mini.files').setup {}
    require('mini.cursorword').setup {}
    require('mini.notify').setup {}
    require('mini.statusline').setup {}
  end,
}
-- "Two words"
