# Neovim config

## External dependencies

These are programs not managed by neovim or its plugins.

| Program                | Needed by                                                    |
|------------------------|--------------------------------------------------------------|
| Neovim 0.12+           |                                                              |
| tree-sitter CLI        | nvim-treesitter `main` branch, to build parsers              |
| C compiler (`cc`)      | tree-sitter, to compile parsers                              |
| Node.js + npm          | Mason, to install and run `pyright` and `vtsls`              |
| git                    | lazy.nvim, to download plugins                               |
| fzf                    | fzf-lua (`<leader>f*` keymaps)                               |
| ripgrep (`rg`)         | fzf-lua `live_grep` (`<leader>fg`)                           |
| fd (optional)          | fzf-lua file finding is faster with it                       |
| curl, unzip, tar, gzip | Mason and nvim-treesitter downloads                          |

## Installation

### System packages:

```sh
sudo apt install build-essential git fzf ripgrep fd-find curl unzip tar gzip
```

### Neovim (AppImage):

```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod +x nvim-linux-x86_64.appimage
mv nvim-linux-x86_64.appimage ~/.local/bin/nvim
```

### tree-sitter CLI
Download the Linux x64 binary from https://github.com/tree-sitter/tree-sitter/releases.
Make it executable, and put it at `~/.local/bin/tree-sitter`.
Don't use apt, whose version may be too old for nvim-treesitter `main`.

### Node.js
Install [nvm](https://github.com/nvm-sh/nvm), then `nvm install --lts`.

## First start

1. Start `nvim`. lazy.nvim installs the plugins, Mason installs the LSP servers, and
   nvim-treesitter compiles the parsers.
2. Run `:checkhealth` to confirm nothing is missing.

## Syncing between machines

Update plugins on one machine, then commit `lazy-lock.json`.
On other machines, pull and run `:Lazy restore` to get the same versions.
If `lazy-lock.json` conflicts, take one side whole and run `:Lazy restore`; don't merge it by hand.
