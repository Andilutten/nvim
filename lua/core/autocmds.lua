local api = vim.api

-- Stolen from norcalli/nvim_utils
function nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		api.nvim_command('augroup '..group_name)
		api.nvim_command('autocmd!')
		for _, def in ipairs(definition) do
			-- if type(def) == 'table' and type(def[#def]) == 'function' then
			-- 	def[#def] = lua_callback(def[#def])
			-- end
			local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
			api.nvim_command(command)
		end
		api.nvim_command('augroup END')
	end
end

nvim_create_augroups {
  terminal = {
	  { "TermOpen", "*", "setl nonumber norelativenumber" }
  },
  git = {
	{ "FileType", "gitcommit,gitrebase,gitconfig", "setl bufhidden=delete" }
  }
}
