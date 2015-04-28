module Tokenizer where

data Token = 
    Program
-- Operators
    Plus
    Minus
    Mult
    Divide
-- Number
    TokInt Integer
        deriving (Show, Eq)

tokenize :: String -> [Token]
tokenize (x:xs)     
