# gf-override.nvim

Enhanced `gf` command for Neovim that allows creating non-existent files.

## Features

- Preserves original `gf` functionality for existing files
- Prompts to create non-existent files
- Creates parent directories automatically if they don't exist

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    "gs-deliverists-io/gf-override.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "gf",
            function()
                require("gf-override").gf_handler()
            end,
            desc = "Enhanced gf command with file creation",
        },
    },
}
```

## License

MIT
