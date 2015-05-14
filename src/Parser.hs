module Parser where

import Data.Char (isDigit, isSpace)
import Data.Function (on)

-- Make the calculator -- a memory register and result
type Calculator = Int -> (Int, Int)

-- Define token so we can tokenize
data Token = 
-- Operators
      TAdd 
    | TSub 
    | TMul 
    | TDiv 
-- Number 
    | TokInt Int
        deriving (Show, Eq)

-- Doctest tests
-- | Tokenize
--
-- >>> tokenize "1+2"
-- [TokInt 1,TAdd,TokInt 2]
--
-- >>> tokenize "3*4-1025"
-- [TokInt 3,TMul,TokInt 4,TSub,TokInt 1025]

-- Side note: I'm not planning on bothering 
-- with lookaheads or real tokenizing until
-- I've got a better handle on this thing.
-- As a consequence, only whole, positive numbers will work (I think)

tokenize :: String -> [Token]
tokenize [] = []
tokenize (c : rest) = 
    -- There's probably a more elegant way to do this...
    if isDigit c then tokenizen (c:rest)
    else if isSpace c then tokenize rest
    else case c of
            '+' -> TAdd : tokenize rest
            '-' -> TSub : tokenize rest
            '*' -> TMul : tokenize rest
            '/' -> TDiv : tokenize rest
            _ -> error "Not a valid string"
-- The number might be more than one character, so we get the whole
-- number this way, then continue tokenizing 
tokenizen cs = TokInt (read n :: Int) : tokenize rest
    where (n, rest) = span isDigit cs
            
data Expr   = N Int
            | Add Expr Expr
            | Subtract Expr Expr
            | Multiply Expr Expr
            | Divide Expr Expr
            | Set Expr
            | Get
        deriving (Show, Eq)

-- Now let's actually parse!

parse :: [Token] -> [Exp]
-- parse [] (0, 0) = Nothing
parse (x:y:xs) (n, m) | y == TAdd = parse 


