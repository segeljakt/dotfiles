setlocal nonumber
setlocal syntax=rust

if &columns > 160
  wincmd L
el
  wincmd K
en
