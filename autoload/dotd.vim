scriptencoding utf-8

if !exists('g:loaded_dotd')
	finish
endif

let s:save_cpo = &cpo
set cpo&vim

function! dotd#date(...)
	let l:str = strftime(g:dotd_date_fmt)
	let l:sep = get(a:, "1", g:dotd_date_sep)
	return l:sep == "/" ? l:str : substitute(l:str, "\\V/", l:sep, "g")
endfunction

function! dotd#time(...)
	let l:str = strftime(g:dotd_time_fmt)
	let l:sep = get(a:, "1", g:dotd_time_sep)
	return l:sep == ":" ? l:str : substitute(l:str, "\\V:", l:sep, "g")
endfunction

function! dotd#datetime(date_sep, sep, time_sep)
	return dotd#date(a:date_sep) . a:sep . dotd#time(a:time_sep)
endfunction

function! dotd#on()
	inoreabbrev <silent> ..d <C-r>=dotd#date()<CR>
	inoreabbrev <silent> ...d <C-r>=dotd#time()<CR>
	inoreabbrev <silent> ....d <C-r>=dotd#datetime(g:dotd_date_sep, g:dotd_datetime_sep, g:dotd_time_sep)<CR>

	inoreabbrev <silent> .'d <C-r>=dotd#date("")<CR>
	inoreabbrev <silent> ..'d <C-r>=dotd#time("")<CR>
	inoreabbrev <silent> ...'d <C-r>=dotd#datetime("", "", "")<CR>

	inoreabbrev <silent> ./d <C-r>=dotd#date("/")<CR>
	inoreabbrev <silent> .-d <C-r>=dotd#date("-")<CR>
	inoreabbrev <silent> .:d <C-r>=dotd#time(":")<CR>

	inoreabbrev <silent> ..:d <C-r>=dotd#datetime(g:dotd_date_sep, g:dotd_datetime_sep, ":")<CR>
	inoreabbrev <silent> ./:d <C-r>=dotd#datetime("/", g:dotd_datetime_sep, ":")<CR>
	inoreabbrev <silent> .-:d <C-r>=dotd#datetime("-", g:dotd_datetime_sep, ":")<CR>
endfunction

function! dotd#off()
	iunabbrev ..d
	iunabbrev ...d
	iunabbrev ....d

	iunabbrev .'d
	iunabbrev ..'d
	iunabbrev ...'d

	iunabbrev ./d
	iunabbrev .-d
	iunabbrev .:d

	iunabbrev ..:d
	iunabbrev ./:d
	iunabbrev .-:d
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
