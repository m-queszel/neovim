# Installation

1. Clone this repository:
   ```sh
   git clone git@github.com:m-queszel/neovim.git ~/.config/nvim
   ```
2. Launch Neovim
   - `lazy.nvim` will bootstrap itself and install all the plugins.

---
---

## Directory Structure

```text
.
├── after
│   └── lsp
│       └── lua_ls.lua
├── GEMINI.md
├── init.lua
├── lazy-lock.json
├── lua
│   └── joseph
│       ├── core
│       │   ├── defaults.lua
│       │   ├── keybinds.lua
│       │   └── treesitter.lua
│       ├── core.lua
│       ├── lazy.lua
│       ├── lsp.lua
│       └── plugins
│           ├── colorscheme.lua
│           ├── lsp
│           │   ├── lsp.lua
│           │   └── mason.lua
│           └── treesitter.lua
├── README.md
└── undodir
```

## Keybindings

The leader key is set to `Space`.

| Mode | Keybind | Description |
| :--- | :--- | :--- |
| **Normal** | `<leader>s` | Global search and replace all word instances under the cursor |
| **Visual** | `J` | Move selected block down (auto-extends file if at bottom) |
| **Visual** | `K` | Move selected block up |
| **Visual** | `y` | Yank (copy) text with a brief highlight |

## Adding a Language Server

To add a new language server, follow these steps:

1.  **Install the server with Mason**: Use the `:Mason` command to open the Mason UI and install the desired language server.

2.  **Find the server name**: Go to the [nvim-lspconfig repository](https://github.com/neovim/nvim-lspconfig/tree/master/lsp) to find the correct server name for the installed language server.

3.  **Enable the server in your configuration**: Add the server to your `lua/joseph/lsp.lua` file by adding a new line with `vim.lsp.enable('SERVERNAME')`, replacing `SERVERNAME` with the name you found in the previous step.

For example, to add the `pyright` language server, you would add the following line to `lua/joseph/lsp.lua`:
```lua
vim.lsp.enable('pyright')
```

## Customizing LSP Configurations

To customize a default LSP configuration, you can create a file in `after/lsp/` named after the LSP server (e.g., `lua_ls.lua` for `lua_ls`). This file will be loaded after the default configuration, allowing you to override specific settings.

**Example: Minor override for `lua_ls`**

To disable the `lua_ls` diagnostic for `undefined-global`, create `after/lsp/lua_ls.lua` with the following content:

```lua
return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
}
```

## Other Features

- **Persistent Undo History**: The `undodir` directory is used to maintain persistent undo history. Typically, if you edit a file, save it, and then close your neovim, your "undo" history is permanently gone. When you re-open that file, you cannot undo your changes and this can be annoying. As such, the `undodir` will keep a record of your save history so that you can always undo your changes even if you exit a file.

