return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      "lua",
      "python",
      "javascript",
      "typescript",
      "html",
      "css",
      "json",
      "yaml",
      "toml",
      "bash",
      "c",
      "php",
      "vim",
      "vimdoc",
      "query" },
  },
  config = function(_, opts)
    require("nvim-treesitter.config").setup(opts)
  end,
}
