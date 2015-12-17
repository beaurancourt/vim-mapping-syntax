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

let b:current_syntax = "vim-mapping-syntax"
