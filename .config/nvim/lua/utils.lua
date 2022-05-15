function set(k, v)
  vim.api.nvim_set_option_value(k, v, {})
end

function unmap(k, v)
  vim.api.nvim_del_keymap(k, v)
end

function let(k, v)
  vim.api.nvim_set_var(k, v)
end

function cmd(code)
  vim.cmd(code)
end

function termcode(s)
  return vim.api.nvim_replace_termcodes(s, true, true, true)
end

function removeFirst(tbl, val)
  for i, v in ipairs(tbl) do
    if v == val then
      return table.remove(tbl, i)
    end
  end
end

function map(mode, lhs, rhs, opts)
  opts = opts or {}
  if opts.noremap == nil then
    opts.noremap = true
  end
  if opts.buffer == true then
    opts.buffer = nil
    vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
  else
    opts.buffer = nil
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
  end
end

function hl(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end
