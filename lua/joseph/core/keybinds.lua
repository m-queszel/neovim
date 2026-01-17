vim.keymap.set("v", "J", function()
  if vim.fn.line("v") == vim.api.nvim_buf_line_count(0) or vim.fn.line(".") == vim.api.nvim_buf_line_count(0) then
    return "<Cmd>lua vim.api.nvim_buf_set_lines(0, -1, -1, false, { '' })<CR>:m '>+1<CR>gv=gv"
  end
  return ":m '>+1<CR>gv=gv"
end, { expr = true, silent = true })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>fe", ":lua MiniFiles.open()<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights text when yanking",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

