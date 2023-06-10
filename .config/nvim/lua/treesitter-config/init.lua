require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash",
        "comment",
        "css",
        "diff",
        "dockerfile",
        "go",
        "hcl",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "make",
        "markdown",
        "proto",
        "python",
        "regex",
        "sql",
        "toml",
        "typescript",
        "vim",
        "yaml",
    },

    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
