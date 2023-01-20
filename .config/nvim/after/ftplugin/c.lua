vim.cmd [[
    let c_gnu              =   1 " GNU gcc specific items
    let c_space_errors     =   1 " trailing white space and spaces before a <Tab>
    let c_curly_error      =   1 " highlight a missing }; this forces syncing from the
    let c_syntax_for_h     =   1 " for *.h files use C syntax instead of C++ and use objc
    let c_comment_strings  =   1 " strings and numbers inside a comment
    let c_no_bracket_error =   1 " don't highlight {}; inside [] as errors
    let c_no_curly_error   =   1 " don't highlight {}; inside [] and () as errors;
    let c_minlines         = 200

    hi _PRE_PROCESSOR guifg=#f1d200
    hi _CCOMMENT      guifg=#928374 gui=NONE
    syn match _CCOMMENT      /[\*:]/             containedin=.*cComment.*
    syn match _PRE_PROCESSOR /[A-Z_][A-Z0-9_]\+/ containedin=.*PreCondit.*
    syn match _PRE_PROCESSOR /[A-Z_][A-Z0-9_]\+/ containedin=.*Macro.*
    syn match _PRE_PROCESSOR /[A-Z_][A-Z0-9_]\+/ containedin=.*cComment.*
  ]]
