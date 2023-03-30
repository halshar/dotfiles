require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash",
        "comment",
        "css",
        "dockerfile",
        "java",
        "go",
        "hcl",
        "html",
        "json",
        "lua",
        "make",
        "markdown",
        "python",
        "regex",
        "sql",
        "toml",
        "yaml",
        "javascript",
        "scss",
        "typescript",
    },

    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
