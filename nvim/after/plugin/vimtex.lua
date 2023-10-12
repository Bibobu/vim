-- Vim options accessors
local o = vim.o
local go = vim.go
local bo = vim.bo

-- go.vimtex_view_method = 'zathura'
-- go.vimtex_compiler_method = 'latexmk'
-- o.maplocalleader = ','
vim.cmd([[

    let g:vimtex_view_method = 'zathura'
    let g:vimtex_compiler_method = 'latexmk'
    let maplocalleader = ','
]])
