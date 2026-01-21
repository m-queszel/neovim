return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  revision = "7c6e0c6a8f399222c53b27b40707328646b149b5",
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
      "query",
      --"blade",
      --"php_only"
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    -- Fix: Use EmranMR fork and specify branch to avoid gzip/tar errors
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }

    -- 2. Setup Filetype Detection
    vim.filetype.add({
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    })

    -- 3. Load Treesitter
    require("nvim-treesitter.configs").setup(opts)
  end,
}
