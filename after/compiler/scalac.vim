if exists("current_compiler")
  finish
endif

if exists(":CompilerSet") != 2    " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

if filereadable( "pom.xml") == 0
  let current_compiler = "scalac"
  CompilerSet makeprg=scalac
  CompilerSet errorformat=%f:%l:\ error:\ %m,%-Z%p^,%-C%.%#,%-G%.%#

  "コンパイル
  map <F5> <ESC>;w<CR>;cd %:h<CR>;make -sourcepath . %:p<CR>;cd -<CR>
  map! <F5> <ESC>;w<CR>;cd %:h<CR>;make -sourcepath . %:p<CR>;cd -<CR>

  "実行
  map <F6> <ESC>;w<CR>;cd %:h<CR>;!scala %:r<CR>;cd -<CR>
  map! <F6> <ESC>;w<CR>;cd %:h<CR>;!scala %:r<CR>;cd -<CR>

  "コンパイル+実行
  map <F7> <ESC>;w<CR>;cd %:h<CR>;make -sourcepath . %:p<CR>;!scala %:r<CR>;cd -<CR>
  map! <F7> <ESC>;w<CR>;cd %:h<CR>;make -sourcepath . %:p<CR>;!scala %:r<CR>;cd -<CR>
else
  let current_compiler = "ant"
  " CompilerSet makeprg=mvn\ -q\ -f\ pom.xml\ compile
  CompilerSet makeprg=mvn\ -f\ pom.xml\ clean\ compile
  " CompilerSet errorformat=[ERROR]\ %f:%l:\ error:\ %m,%-Z%p^,%-C%.%#,%-G%.%#
  CompilerSet errorformat=%E%>[ERROR]\ %f:%l:\ error:\ %m,%%W%>[WARNING]\ %f:%l:\ warning:\ %m,-Z[INFO]\ %p^,%C[INFO]%m,%-Z,%-C%.%#,%-G%.%#

  "コンパイル
  map <F5> <ESC>;wa<CR>;make <CR><CR>;cw<CR><CR>
  map! <F5> <ESC>;wa<CR>;make <CR><CR>;cw<CR><CR>

  "実行
  map <F6> <ESC>;wa<CR>;!mvn scala:console <CR><CR>
  map! <F6> <ESC>;wa<CR>;!mvn scala:console <CR><CR>

  "コンパイル+実行
  map <F7> <ESC>;wa<CR>;make <CR>;!mvn scala:console<CR><CR>
  map! <F7> <ESC>;wa<CR>;make <CR>;!mvn scala:console<CR><CR>
endif

