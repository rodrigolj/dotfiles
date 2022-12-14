require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = false,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        "ruby",
        "tsx",
        "toml",
        "fish",
        "php",
        "json",
        "yaml",
        "swift",
        "html",
        "scss"
    },
    autotag = {
        enable = true,
        filetypes = { "html", "xml", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "vue",
            "tsx", "jsx", "php", "markdown", "eruby" },
    }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
