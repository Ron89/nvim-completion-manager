
if get(g:,'cm_enable_for_all',1)
	" simple ignore files larger than 1M, for performance
	au BufWinEnter * if (exists('b:cm_enable')==0 && line2byte(line("$") + 1)<1000000) | call cm#enable_for_buffer() | endif
endif


" wait for a while before popping up, in milliseconds, this would reduce the
" popup menu flashes when multiple sources are updating the popup menu in a
" short interval, use a interval which is long enough for computer and short
" enough for human
let g:cm_complete_delay = get(g:,'cm_complete_delay',50)

" automatically enable all sources
" set this to 0 if you want to select sources manually
let g:cm_sources_enable = get(g:,'cm_sources_enable',1)

" used to override default options of sources
let g:cm_sources_override = get(g:,'cm_sources_override',{})


au User CmSetup call cm#register_source({'name' : 'cm-ultisnips',
		\ 'priority': 7, 
		\ 'abbreviation': 'Snip',
		\ 'cm_refresh_patterns':['\S{1,}$'],
		\ 'cm_refresh': 'cm#sources#ultisnips#cm_refresh',
		\ })

" css
" the omnifunc pattern is PCRE
au User CmSetup call cm#register_source({'name' : 'cm-css',
		\ 'priority': 9, 
		\ 'scopes': ['css','scss'],
		\ 'abbreviation': 'css',
		\ 'cm_refresh_patterns':['\w{2,}$',':\s+\w*$'],
		\ 'cm_refresh': {'omnifunc': 'csscomplete#CompleteCSS'},
		\ })


" Note: the channels field is required as an array, on most cases only one
" channel will would be enough. While there may be cases in which you need
" another thread to do the indexing, caching work, it's easier to use another
" channel instead of controlling threading on your own.

" " keyword
" call cm#register_source({
" 		\ 'name' : 'cm-bufkeyword',
" 		\ 'priority': 5, 
" 		\ 'abbreviation': 'Key',
" 		\ 'channels': [
" 		\   {
" 		\		'type': 'python3',
" 		\		'path': 'autoload/cm/sources/cm_bufkeyword.py',
" 		\		'events':['CursorHold','CursorHoldI','BufEnter','BufWritePost','TextChangedI'],
" 		\		'detach':1,
" 		\	}
" 		\ ],
" 		\ })

