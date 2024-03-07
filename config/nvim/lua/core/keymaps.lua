local map = require("helpers.keymap").map

-- Unbind some keys
map("n", "q", "<nop>", "Unbind q")

-- Editor stuff
-- map("n", "<C-z>", "u", "Undo")

-- Windows navigation
map("n", "<S-Tab>", "<C-w>W", "Move to previous window")
map("n", "<Tab>", "<C-w>w", "Move to next window")

-- Easier access to beginning and end of lines and words
map({ "n", "v" }, "<C-k>", "gg", "Go to top")
map({ "n", "v" }, "<C-j>", "G", "Go to bottom")
map({ "n", "v" }, "<S-h>", "^", "Go to beginning of line")
map({ "n", "v" }, "<S-l>", "$", "Go to end of line")

-- Visual mode actions
map("v", "T", "mzJ`z", "Join lines without moving the cursor")
map("v", "J", ":m '>+1<CR>gv=gv", "Move the selected lines down")
map("v", "K", ":m '>-2<CR>gv=gv", "Move the selected lines up")

-- Common actions
map("n", "<leader>qq", ":q<cr>", "Quit")
map("n", "<leader>qa", ":qa!<cr>", "Quit all")
map("n", "<leader>qw", ":close<cr>", "Quit current window")

-- Telescope
local t = require("helpers.telescope")
map("n", "<leader>fr", t.open_recent, "Open recent files")
map("n", "<leader>ff", t.find_files, "Find files")
map("n", "<leader>fg", t.live_grep, "Live grep")
map("n", "<leader>fb", t.buffers, "Buffers")
map("n", "<leader>fh", t.help_tags, "Help tags")
map("n", "<leader>fs", t.grep_string, "Grep string")


map("n", "<leader>fw", ":w<cr>", "Write")
map("n", "<leader>fa", ":wa<cr>", "Write all")

-- Navigate buffers
map({ "n", "v" }, "<", ":BufferPrevious<CR>", "Previous buffer")
map({ "n", "v" }, ">", ":BufferNext<CR>", "Next buffer")
map({ "n", "v" }, '..', ':BufferOrderByBufferNumber<CR>', "Sort buffer by number")

-- Deleting buffers
map("n", "<leader>w", ":BufferClose<CR>", "Close buffer")
map("n", "<leader>W", ":BufferCloseAllButPinned<CR>", "Close all buffers but pinned")

-- Nvim-tree
map({ "n", "v" }, "--", ":NvimTreeToggle<cr>", "Toggle file explorer")
map({ "n", "v" }, "-=", ":NvimTreeFindFile<cr>", "Move the cursor in the tree for the current buffer")

-- ToggleTerm terminal keymaps
map("t", "<esc>", [[<C-\><C-n>]], "ToggleTerm: Go back to normal mode")
