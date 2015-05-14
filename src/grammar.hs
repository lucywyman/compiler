module Grammar where

program ::= line {[newline line]}
line ::= expression {[whitespace expression]}
expression ::= "Int" operator "Int"
operator = "+" | "-" | "*" | "/"
whitespace = ""
