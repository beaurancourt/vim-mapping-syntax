if exists("b:current_syntax")
    finish
endif

syntax keyword mappingKeyword codelist
syntax keyword mappingKeyword with
highlight link mappingKeyword Keyword

let b:current_syntax = "vim-mapping-syntax"
