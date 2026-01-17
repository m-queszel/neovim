local smart_splits = require("joseph.core.customBinds.smart_splits")

vim.keymap.set("v", "J", function()
  if vim.fn.line("v") == vim.api.nvim_buf_line_count(0) or vim.fn.line(".") == vim.api.nvim_buf_line_count(0) then
    return "<Cmd>lua vim.api.nvim_buf_set_lines(0, -1, -1, false, { '' })<CR>:m '>+1<CR>gv=gv"
  end
  return ":m '>+1<CR>gv=gv"
end, { expr = true, silent = true })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>fe", ":lua MiniFiles.open()<CR>")

vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete current buffer" })



vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights text when yanking",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


vim.keymap.set('n', '<C-h>', function() smart_splits.smart_split('h') end, { desc = 'Move focus to the left window or split' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-l>', function() smart_splits.smart_split('l') end, { desc = 'Move focus to the right window or split' })

vim.keymap.set('t', '<C-h>', function() smart_splits.smart_split('h') end, { desc = 'Move focus to the left window or split' })
vim.keymap.set('t', '<C-j>', '<cmd>wincmd j<CR>', { desc = 'Move focus to the lower window' })
vim.keymap.set('t', '<C-k>', '<cmd>wincmd k<CR>', { desc = 'Move focus to the upper window' })
vim.keymap.set('t', '<C-l>', function() smart_splits.smart_split('l') end, { desc = 'Move focus to the right window or split' })