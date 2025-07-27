local harpoon = require('harpoon')

require('harpoon').setup({})

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

local map = vim.keymap.set
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

map('n', '<leader>a', mark.add_file)
map('n', '<C-e>', function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

map('n', '<C-S-P>', function() harpoon:list():prev() end)
map('n', '<C-S-N>', function() harpoon:list():next() end)

map('n', '<C-h>', function() harpoon:list():select(1) end)
map('n', '<C-t>', function() harpoon:list():select(2) end)
map('n', '<C-n>', function() harpoon:list():select(3) end)
map('n', '<C-s>', function() harpoon:list():select(4) end)
