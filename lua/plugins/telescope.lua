local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tf', builtin.find_files, {}) -- search file
vim.keymap.set('n', '<C-t>', builtin.git_files, {}) -- search git file
vim.keymap.set('n', '<leader>tg', function() 
	builtin.grep_string({ search = vim.fn.input("Grep > ") }) -- grep files
end) 
