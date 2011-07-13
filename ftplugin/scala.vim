compiler scalac
if !exists('g:neocomplcache_include_patterns')
    let g:neocomplcache_include_patterns= {}
endif
let g:neocomplcache_include_patterns['scala'] = '^import'

if !exists('g:neocomplcache_dictionary_filetype_lists')
    let g:neocomplcache_dictionary_filetype_lists= {}
endif
let g:neocomplcache_dictionary_filetype_lists['scala'] = $HOME.'/.vim/bundle/vim-scala/dict/scala.dict'


