-- According to the new API, we need to enable features via autocommands.
-- We will enable highlighting and indentation for a list of common languages.
-- You can add more languages to this list as you install their parsers.
local filetypes = {
  "lua", "python", "javascript", "typescript", "html", "css",
  "json", "yaml", "toml", "bash", "c", "php", "vim", "vimdoc", "query",
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = filetypes,
  callback = function()
    -- Enable highlighting
    vim.treesitter.start()
    -- Enable indentation
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
