# Neovim Configuration

## Directory Structure

```text
.
├── .gitignore
├── init.lua
├── README.md
├── after/
├── lua/
│   └── initialization/
│       ├── init.lua
│       ├── configs/
│       │   ├── defaults.lua
│       │   ├── keybinds.lua
│       │   └── lazy_init.lua
│       └── plugins/
└── undodir/
```

## Keybindings

The leader key is set to `Space`.

| Mode | Keybind | Description |
| :--- | :--- | :--- |
| **Normal** | `<leader>s` | Global search and replace all word instances under the cursor |
| **Visual** | `J` | Move selected block down (auto-extends file if at bottom) |
| **Visual** | `K` | Move selected block up |
| **Visual** | `y` | Yank (copy) text with a brief highlight |


## Other Features

- **Persistent Undo History**: The `undodir` directory is used to maintain persistent undo history. Typically, if you edit a file, save it, and then close your neovim, your "undo" history is permanently gone. When you re-open that file, you cannot undo your changes and this can be annoying. As such, the `undodir` will keep a record of your save history so that you can always undo your changes even if you exit a file.

