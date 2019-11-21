setlocal nonumber
setlocal t_ve=
nno <buffer> j <C-e>
nno <buffer> k <C-y>

if winwidth(0) > 160
  wincmd L
el
  wincmd K
en
