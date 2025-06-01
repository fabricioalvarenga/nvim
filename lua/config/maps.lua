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
keymap.set("n", "ss", ":split<Return><C-w>w", opts)
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
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Map ESC key 
keymap.set("i", "ee", "<Escape>")

-- nvim-tree plugin
keymap.set("n", "tt", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "tf", ":NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
keymap.set("n", "tc", ":NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
keymap.set("n", "tr", ":NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

-- nvim-spectre plugin
local spectre = require("spectre")
keymap.set("n", "sr", function() spectre.open() end, { desc = "Open Spectre" })
keymap.set("n", "sf", function() spectre.open_file_search() end, { desc = "Open Spectre" })

-- telescope pllugin
local builtin = require("telescope.builtin")
keymap.set("n", "ff", builtin.find_files, { desc = "Telescope find files" })
keymap.set("n", "fg", builtin.live_grep, { desc = "Telescope find files" })
keymap.set("n", "fb", builtin.buffers, { desc = "Telescope find files" })
keymap.set("n", "fh", builtin.help_tags, { desc = "Telescope find files" })
