local M = {}

M.setup = function(opts)
	-- Setup function for any future configuration options
end

M.gf_handler = function()
	local current_word = vim.fn.expand("<cfile>")
	local current_path = vim.fn.expand("%:p:h")
	local target_path = vim.fn.fnamemodify(current_path .. "/" .. current_word, ":p")

	if vim.uv.fs_stat(target_path) then
		vim.cmd("normal! gf")
		return
	end

	local create = vim.fn.confirm(string.format("File '%s' doesn't exist. Create it?", target_path), "&Yes\n&No", 2)

	if create == 1 then
		local dir = vim.fn.fnamemodify(target_path, ":h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end

		local ok, err = pcall(function()
			local file = io.open(target_path, "w")
			if file then
				file:close()
				vim.cmd.edit(vim.fn.fnameescape(target_path))
			end
		end)

		if not ok then
			vim.notify("Failed to create file: " .. target_path, vim.log.levels.ERROR)
		end
	end
end

return M
