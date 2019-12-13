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

" Matches numbers of the form  2, 123.23, 1e-2, and 1.9956e+2.
" Look for 1 or more digits then an optional dot followed by one or more
" digits followed by an optional final segment consisting of e then (+ or -)
" and one or more digits followed by a word boundary.
syntax match potionNumber "\v\d+\.=\d{-}(e(-|\+)\d+)=>" 
" Match hex numbers
syntax match potionNumber "\v0x[0-9a-f]+>" 

highlight link potionNumber Number

let b:current_syntax = "potion"
