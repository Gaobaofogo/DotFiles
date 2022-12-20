vim.cmd [[
try
  syntax enable
  let g:dracula_colorterm=0
  colorscheme catppuccin_mocha
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
