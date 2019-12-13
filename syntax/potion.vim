if exists("b:current_syntax")
    finish
endif

syntax keyword potionKeyword loop times to while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return
highlight link potionKeyword Keyword


syntax keyword potionFunction print join string
highlight link potionFunction Function

syntax match potionComment "\v#.*$"
highlight link potionComment Comment

syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\="
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="
syntax match potionOperator "\v-\="
syntax match potionOperator "\v\."
syntax match potionOperator "\v:"

highlight link potionOperator Operator

" Match forward slach up to next word boundary non greedy.
syntax match potionFieldDef "\v/.{-1,}>" 
" There is no standard group defined for fields, so we just set the color
" to Cyan
highlight potionFieldDef ctermfg=Cyan

let b:current_syntax = "potion"
