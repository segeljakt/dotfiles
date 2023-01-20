local opt_expr = { noremap = true, silent = false, nowait = true, expr = true }

vim.keymap.set('i', '<C-p>', 'GetPreCursorChar() == " " ? "\\|> " : " \\|> "', opt_expr)
vim.keymap.set('i', '<C-o>', 'GetPreCursorChar() == " " ? "-> " : " -> "', opt_expr)
vim.keymap.set('i', 'ı', 'GetPreCursorChar() == " " ? "| " : " | "', opt_expr) -- <C-i>
