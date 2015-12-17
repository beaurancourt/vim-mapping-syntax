if exists("b:current_syntax")
    finish
endif

syntax keyword mappingKeyword codelist
syntax keyword mappingKeyword with

syntax match mappingComment "\v;.*$"

highlight link mappingKeyword Keyword
highlight link mappingComment Comment

let b:current_syntax = "vim-mapping-syntax"
