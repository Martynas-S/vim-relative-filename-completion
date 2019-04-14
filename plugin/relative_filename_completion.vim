if exists("g:relative_filename_completion")
  finish
endif
let g:relative_filename_completion = 1

let s:temporarilyLcded = 0

function! s:temporaryLcd()
    let s:rootCwd = getcwd()
    let s:fileCwd = expand('%:p:h')
    let s:temporarilyLcded = 1

    execute ':lcd ' . s:fileCwd
endfunction

function! s:cdToRoot()
    if s:temporarilyLcded
        execute ':lcd ' . s:rootCwd
    endif
    let s:temporarilyLcded = 0
endfunction

autocmd InsertLeave * call s:cdToRoot()

inoremap <silent> <Plug>RelativeFilenameCompletion
        \ <Esc>:call <SID>temporaryLcd()<CR>a<C-x><C-f>

inoremap <silent> <Plug>NormalFilenameCompletion
        \ <Esc>:call <SID>cdToRoot()<CR>a<C-x><C-f>

if !hasmapto('<Plug>RelativeFilenameCompletion')
            \ && empty(maparg('<C-x><C-r>', 'i'))
    imap <C-x><C-r> <Plug>RelativeFilenameCompletion
endif

imap <C-x><C-f> <Plug>NormalFilenameCompletion
