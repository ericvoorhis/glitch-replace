module GlitchReplace.Image
( replaceWith
) where

import Data.Char
import qualified Data.ByteString.Char8 as Char8
import qualified Data.String.Utils     as StringUtils
import qualified System.Random         as Random

escapeChars = [("\\n", "\n"), ("\\r", "\r"), ("\\t", "\\t")]

replaceWith' :: Char -> [Char] -> [Char] -> [Char]
replaceWith' _ _ [] = []
replaceWith' swap with (x:xs) = item ++ (replaceWith' swap with xs)
    where item = 
            if x == swap
            then with
            else [x]

replaceWith :: Char -> [Char] -> [Char] -> Char8.ByteString
replaceWith s w i = Char8.pack . replaceWith' s w $ i
