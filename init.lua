local opt = vim.opt
local g = vim.g
local config = require("core.utils").load_config()

opt.laststatus = 2 -- global statusline
opt.showmode = true

opt.clipboard = ""

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

opt.undofile = false

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

vim.wo.relativenumber = true

vim.cmd([[
    function RunFileGo()
        :! go build -o %:r %
        if v:shell_error == 0
            :! gnome-terminal -- bash -c "time ./%:r; echo ""; echo 'Press Enter to exit......'; read x"
        endif
    endfunction

    augroup exe_code
        autocmd!
        autocmd FileType python nnoremap <buffer> <F6>
            \ :w <CR> :sp<CR> :term /usr/bin/time -f "-----------------\n  Real: \%e sec\n  User: \%U sec\nMemory: \%M KB" 
            \ python3 %<CR> :startinsert<CR>

        autocmd Filetype cpp nnoremap <buffer> <F5> 
            \ :w <bar> :! g++ -Wall -Wextra -std=c++17 % -o %:r <CR>

        autocmd Filetype cpp nnoremap <buffer> <F7> 
            \ :w <bar> :! g++ -Wall -Wextra -pedantic -std=c++17 -O2 -Wshadow -Wformat=2 -Wfloat-equal 
            \ -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align 
            \ -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address 
            \ -fsanitize=undefined -fno-sanitize-recover -fstack-protector  % -o %:r <CR>

        autocmd FileType cpp nnoremap <buffer> <F6>
            \ :w <CR> :sp<CR> :term /usr/bin/time -f "-----------------\n  Real: \%e sec\n  User: \%U sec\nMemory: \%M KB" 
            \ ./%:r<CR> :startinsert<CR>

        autocmd FileType java nnoremap <buffer> <F5>
            \ :w <bar> :! javac % <CR>

        autocmd FileType java nnoremap <buffer> <F7>
            \ :w <bar> :! javac -Xlint:all % <CR>

        autocmd Filetype java nnoremap <buffer> <F6>
            \ :w <CR> :sp<CR> :term /usr/bin/time -f "-----------------\n  Real: \%e sec\n  User: \%U sec\nMemory: \%M KB" 
            \ java %:r<CR> :startinsert<CR>

        autocmd Filetype go nnoremap <buffer> <F5> 
            \ :w <bar> :! go build -o %:r % <CR>
        
        autocmd Filetype go nnoremap <buffer> <F6> 
            \ :w <bar> call RunFileGo() <CR>


    augroup END
]])
