local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
map("n", "<leader>pv", vim.cmd.Ex)

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_set_keymap("n", "<leader>tf", "<Plug>PlenaryTestFile", { noremap = false, silent = false})

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "=ap", "ma=ap'a")

map("x", "<leader>p", [["_dP]])

map({"n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", "\"_d")

map("i", "<C-c>", "<Esc>")

map("n", "Q", "<nop>")
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
map("n", "<M-h>", "<cmd>silent !tmux-sessionizer -s 0 --vsplit<CR>")
map("n", "<M-H>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")

map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<left><left><left>]])
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

map(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

map(
    "n",
    "<leader>ea",
    "oassert.NoError(err, \"\")<Esc>F\";a"
)

map(
    "n",
    "<leader>ef",
    "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj"
)

map(
    "n",
    "<leader>el",
    "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i"
)

map("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Gitsigns: navigate between git "hunks" (changed sections)
map("n", "]c", function()
    if vim.wo.diff then return "]c" end
    vim.schedule(function() require("gitsigns").next_hunk() end)
    return "<Ignore>"
end, { expr = true })

map("n", "[c", function()
    if vim.wo.diff then return "[c" end
    vim.schedule(function() require("gitsigns").prev_hunk() end)
    return "<Ignore>"
end, { expr = true })

-- Undotree: toggle the undo history tree
map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })

-- Telescope Fuzzy Finder
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
