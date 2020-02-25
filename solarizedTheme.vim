set notgc
set t_Co=256

set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1

function! InitialBackground()
	let l:initial = split("10:00", ":")
	let l:final = split("19:00", ":")
	let l:now = split(strftime("%H:%M"), ":")

	let l:initialToNow = ((l:now[0] * 60 + l:now[1]) - (l:initial[0] * 60 + l:initial[1]))
	let l:nowToFinal = ((l:now[0] * 60 + l:now[1]) - (l:final[0] * 60 + l:final[1]))

	if (l:initialToNow > 0 && l:nowToFinal < 0)
		set background=light
	endif
endfunction

call InitialBackground()

nnoremap <silent><leader>tcs :call ToggleBackgroundTransparencySolarized()<cr>

function! ToggleBackgroundTransparencySolarized()
	if g:solarized_termtrans
		let g:solarized_termtrans=0
		colo solarized
	else
		let g:solarized_termtrans=1
		colo solarized
	endif
endfunction
