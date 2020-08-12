" File:         tcr.vim
" Description:  Test && Commit || Revert plugin
" Author:       Scott Windsor <swindsor@gmail.com>
" License:      MIT
" Version:      0.0.1
"
"   ________________ 
"  /_  __/ ____/ __ \
"   / / / /   / /_/ /
"  / / / /___/ _, _/ 
" /_/  \____/_/ |_|  

let s:tcr_commit_message = "TCR"
let s:tcr_revert_command = "git reset --hard"
let s:tcr_enable = 0

if exists("g:tcr_commit_message")
  let s:tcr_commit_message = g:tcr_commit_message
endif

if exists("g:tcr_revert_command")
  let s:tcr_revet_message = g:tcr_revet_command
endif

if exists("g:tcr_enable")
  let s:tcr_enable = g:tcr_enable
endif


function! TCRRun(test_command)
  let commit_command = 'git commit -am ' . s:tcr_commit_message
  execute '!' . a:test_command . ' && ' . commit_command . ' || ' . s:tcr_revert_command
endfunction

function! EnableTCR()
  let s:tcr_enable=1
  autocmd! BufWritePost,FileWritePost *.rb call TCRRun('ruby ' . shellescape(bufname("%")))
  autocmd! BufWritePost,FileWritePost *.ts call TCRRun('npm test')
  autocmd! BufWritePost,FileWritePost *.js call TCRRun('npm test')
  autocmd! BufWritePost,FileWritePost *.kt call TCRRun('./gradlew test')
  echom "TCR on"
endfunction

function! DisableTCR()
  let s:tcr_enable=0
  autocmd! BufWritePost,FileWritePost *.rb
  autocmd! BufWritePost,FileWritePost *.ts
  autocmd! BufWritePost,FileWritePost *.js
  autocmd! BufWritePost,FileWritePost *.kt
  echom "TCR off"
endfunction

function! ToggleTCR()
  if s:tcr_enable == 1
    call DisableTCR()
  else
    call EnableTCR()
  endif
endfunction

command! -bang -nargs=* TCRon call EnableTCR()
command! -bang -nargs=* TCRoff call DisableTCR()
command! -bang -nargs=* TCR call ToggleTCR()
