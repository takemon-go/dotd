scriptencoding utf-8

if exists('g:loaded_dotd')
	finish
endif
let g:loaded_dotd = 1

let s:save_cpo = &cpo
set cpo&vim

let g:dotd_date_fmt = "%Y/%m/%d"
let g:dotd_date_sep = "."
let g:dotd_time_fmt = "%H:%M:%S"
let g:dotd_time_sep = ":"
let g:dotd_datetime_sep = " "

command! DotdOn call dotd#on()
command! DotdNo call dotd#off()

DotdOn

let &cpo = s:save_cpo
unlet s:save_cpo
