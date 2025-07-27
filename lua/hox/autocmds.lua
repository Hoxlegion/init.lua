local augroup = vim.api.nvim_create_augroup
local HoxGroup = augroup('Hox', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
	require("plenary.reload").reload_module(name)
end

vim.api.nvim_create_user_command("ReloadModule", function(opts)
	R(opts.args)
end, { nargs = 1 })

autocmd('TextYankPost', {
	group = yank_group,
	pattern = '*',
	callback = function()
        vim.highlight.on_yank({
			higroup = 'IncSearch',
			timeout = 40,
		})
	end,
})

autocmd({"BufWritePre"}, {
	group = HoxGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd('BufEnter', {
	group = HoxGroup,
	callback = function()
		vim.cmd.colorscheme("rose-pine-moon")
	end
})

autocmd('BufEnter', {
    group = HoxGroup,
    pattern = "*",
    callback = function(args)
        local file = vim.api.nvim_buf_get_name(args.buf)

        if vim.fn.filereadable(file) == 1 then
            local dir = vim.fn.fnamemodify(file, ':h')
            vim.cmd('lcd ' .. vim.fn.fnameescape(dir))
        end
    end,
})
