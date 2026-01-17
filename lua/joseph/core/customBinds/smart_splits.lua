local M = {}

function M.smart_split(direction)
  local current_win = vim.fn.winnr()
  vim.cmd('wincmd ' .. direction)
  if vim.fn.winnr() == current_win then
    if direction == 'l' then
      vim.cmd('vsplit')
    else
      vim.cmd('leftabove vsplit')
    end
  end
end

return M
