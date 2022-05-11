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
  vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
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
  if opts.remap == nil then
    opts.noremap = true
  else
    opts.remap = nil
    opts.noremap = false
  end
  opts.silent = true
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end
