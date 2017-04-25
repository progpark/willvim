scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim


function! s:_vital_loaded(V)
	let s:V = a:V
	let s:E  = s:V.import("Over.Exception")
endfunction


function! s:_vital_depends()
	return [
\		"Over.Exception",
\	]
endfunction


let s:cache_command = {}
function! s:doautocmd_user(prefix, command)
	let group =  a:prefix . "-vital-over-commandline-doautocmd-dummy"
	if !has_key(s:cache_command, a:prefix)
		let s:cache_command[a:prefix] = {}
	endif

	if !has_key(s:cache_command[a:prefix], a:command)
		execute "autocmd " . group
\			. " User " . a:command." silent! execute ''"

		if v:version > 703 || v:version == 703 && has("patch438")
			let s:cache_command[a:prefix][a:command] = "doautocmd <nomodeline> User " . a:command
		else
			let s:cache_command[a:prefix][a:command] = "doautocmd User " . a:command
		endif
	endif

	execute s:cache_command[a:prefix][a:command]
endfunction


let s:hooks = [
\	"enter",
\	"leave",
\	"char",
\	"char_pre",
\	"draw",
\	"draw_pre",
\	"execute_pre",
\	"execute_failed",
\	"execute",
\	"exception",
\]

let s:hooks_camel = [
\	"Enter",
\	"Leave",
\	"Char",
\	"CharPre",
\	"Draw",
\	"DrawPre",
\	"ExecutePre",
\	"ExecuteFailed",
\	"Execute",
\	"Exception",
\]


let s:module = {
\	"name" : "Doautocmd",
\}


for s:i in range(len(s:hooks))
	execute join([
\		"function! s:module.on_" . s:hooks[s:i] . "(cmdline, ...)",
\		"	let s:cmdline = a:cmdline",
\		"	call s:doautocmd_user(self.prefix, self.prefix . " . string(s:hooks_camel[s:i]) . ")",
\		"endfunction",
\	], "\n")
endfor


function! s:get_cmdline()
	if !exists("s:cmdline")
		execute s:E.throw_cmd("Undefined cmdline object.", "Over.Commandline.Modules.Doautocmd")
	endif
	return s:cmdline
endfunction


function! s:make(prefix)
	if has_key(s:cache_command, a:prefix)
		unlet! s:cache_command[a:prefix]
	endif
	execute "augroup " a:prefix . "-vital-over-commandline-doautocmd-dummy"
		autocmd!
	augroup END

	let module = deepcopy(s:module)
	let module.prefix = a:prefix
	return module
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
