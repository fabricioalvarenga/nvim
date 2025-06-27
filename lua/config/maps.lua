local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do not yank with 
keymap.set("n", "x", '"_x')

-- Increment/Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New tab
keymap.set("n", "te", ":tabedit<Return>", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<S-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "sb", ":split<Return><C-w>w", opts)
keymap.set("n", "sv", ":vsplit<Return><C-w>w", opts)

-- Move window
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "s<left>", "<C-w>h")
keymap.set("", "s<up>", "<C-w>k")
keymap.set("", "s<down>", "<C-w>j")
keymap.set("", "s<right>", "<C-w>l")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w>,", "5<C-w><") -- same key as <
keymap.set("n", "<C-w>.", "5<C-w>>") -- same key as >
keymap.set("n", "<C-w>=", "5<C-w>+") -- same key as +
keymap.set("n", "<C-w>-", "5<C-w>-")

-- Map ESC key 
keymap.set("i", "qq", "<Escape>")
keymap.set("n", "qq", "<Escape>")
keymap.set("v", "qq", "<Escape>")

-- nvim-tree plugin
keymap.set("n", "tt", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "tf", ":NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
keymap.set("n", "tc", ":NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
keymap.set("n", "tr", ":NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

-- nvim-spectre plugin
local spectre = require("spectre")
keymap.set("n", "sr", function() spectre.open() end, { desc = "Open Spectre" })
keymap.set("n", "sf", function() spectre.open_file_search() end, { desc = "Open Spectre" })

-- telescope plugin
local telescope = require("telescope.builtin")
keymap.set("n", "ff", telescope.find_files, { desc = "Telescope find files" })
keymap.set("n", "fg", telescope.live_grep, { desc = "Telescope find files" })
keymap.set("n", "fb", telescope.buffers, { desc = "Telescope find files" })
keymap.set("n", "fh", telescope.help_tags, { desc = "Telescope find files" })

-- LSP
local function setup_global_lsp_mappings()
     vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP Actions",
        callback = function(args)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true }) -- Shows information about what is under the cursor
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true }) -- Go to definition
        end,
    })
end
setup_global_lsp_mappings()


