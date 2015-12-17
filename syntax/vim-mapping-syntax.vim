if exists("b:current_syntax")
    finish
endif

syntax keyword mappingKeyword codelist
syntax keyword mappingKeyword with
highlight link mappingKeyword Keyword

syntax match mappingComment "\v;.*$"
highlight link mappingComment Comment

syntax region mappingString start=/\v"/ skip=/\v\\./ end=/\v"/
highlight link mappingString String

syntax match mappingDelimiter "\v\/"
highlight link mappingDelimiter Delimiter

syntax match mappingOperator "\v\+\+"
syntax match mappingOperator "\v\$"
syntax keyword mappingOperator &
highlight link mappingOperator Operator

syntax match mappingArrow "\v(-\>|\<-)"
syntax match mappingArrow "\v\<-\>"
highlight link mappingArrow Operator

syntax match mappingFunction "\v \S+ " contained
syntax region mappingFunctionRegion start=/\v(-\>|-\>\>|\<-|\<\<-)/ end=/\v(-\>|-\>\>|\<-|\<\<-)/ contains=mappingFunction oneline
highlight link mappingFunction Function
highlight link mappingFunctionRegion Operator

let b:current_syntax = "vim-mapping-syntax"
