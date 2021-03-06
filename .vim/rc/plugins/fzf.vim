" let fzf_path = system('which fzf')
" set rtp+=fzf_path
" set rtp+=/usr/bin/fzf

" let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
let $FZF_DEFAULT_COMMAND = 'rg -l ""'
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fg :GFiles?<CR>
nnoremap <Leader>fr :Rg 
nnoremap <Leader>ft :Tags<CR>
nnoremap <Leader>fm :History<CR>

" preview file with :Files
command! -bang -nargs=? -complete=dir Files
 \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

run ripgrep with :Rg
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
\   <bang>0 ? fzf#vim#with_preview('right:50%:hidden', '?')
\           : fzf#vim#with_preview('up:60%'),
\   <bang>0)
