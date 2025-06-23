return {
    "christoomey/vim-tmux-navigator",

    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateRight",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigatePrevious",
        "TmuxNavigateProcessList",
    },

    keys = {
        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
}
