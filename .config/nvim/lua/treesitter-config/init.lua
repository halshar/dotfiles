require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "lua",
        "go",
        "python",
        "bash",
        "dockerfile",
        "json",
        "regex",
        "yaml",
        "markdown"
    },

    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
} 
