vim.keymap.set("n", "-", vim.cmd.Ex) -- need nvim 0.8+

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', 'gt', builtin.tags, { desc = '[G]o to C[T]ags (telescope)', noremap = true })


-- Key mappings to refresh tags
function RTags()
  vim.cmd [[!ctags -f .tags --languages=go --exclude=.git -R .]]
end
vim.keymap.set("n", "gT", RTags)

-- navigation
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-h>', '<C-w>h')

-- buffer operations
vim.keymap.set('n', '<S-h>', ":BufferLineCyclePrev<CR>")
vim.keymap.set('n', '<S-l>', ":BufferLineCycleNext<CR>")
vim.keymap.set('n', '<C-w>o', ":BufferLineCloseOthers<CR>")
vim.keymap.set('n', '<C-w>L', ":BufferLineCloseRight<CR>")
vim.keymap.set('n', '<C-w>R', ":BufferLineCloseLeft<CR>")

vim.keymap.set('n', '<F7>', ":TroubleToggle<CR>")
vim.keymap.set('n', '<leader>tt', ":NvimTreeToggle<CR>")
