function! s:PhpStylist()
    execute "w"
    normal ggdG
    execute "0r!~/bin/phpStylist %"
    normal Gdd
endfunction
command! PhpStylist call <SID>PhpStylist()
