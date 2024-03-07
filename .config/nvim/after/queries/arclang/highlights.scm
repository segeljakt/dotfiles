;; Literals

(constant_string (string_quote) @string)
(constant_string (string_content) @string)
(constant_int) @number
(constant_bool) @boolean
(constant_float) @float
(constant_char) @character
(string_interpolation (block)) @string.special
(string_interpolation (name)) @string.special
(comment) @comment

;; Identifiers

(expr_name) @variable
(pattern_name) @variable
(stmt_def (name) @function)
(type_name) @type
(stmt_type (name) @type.definition)

(expr_call (expr_name (name)))

((type_name) @type.builtin
 (#match? @type.builtin "I8|I16|I32|I64|I128|F32|F64|U8|U16|U32|U64"))

((type_name) @type.builtin
 (#match? @type.builtin "Option|Vec|Text|Dict|Stream"))

;; Keywords

[ "if" "else" "match" ] @conditional

[ "loop" "while" "for" "break" "continue" ] @repeat

[
  "and" "as" "break" "catch" "continue" "def" "desc" "do" "else" "finally" "for"
  "from" "fun" "group" "in" "into" "join" "loop" "match" "not" "on" "or" "of"
  "return" "select" "compute" "throw" "try" "type" "val" "var" "where"
  "while" "union" "over" "roll" "order" "enum"
] @keyword

;; Punctuation

; [ ";" ":" "::" "," "." "@" "{" "}" "[" "]" "(" ")" "=" "=>" "_" ] @punctuation

[ "not" "and" "or" "+" "-" "*" "/" "==" "!=" "<" ">" "<=" ">=" "+=" "-=" "*=" "/=" ".." "..=" "&" "++" ] @operator

"rust" @keyword
