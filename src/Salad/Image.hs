module Salad.Image
( swap
) where

import Data.Char
import qualified Data.ByteString.Char8 as Char8
import qualified Data.String.Utils     as StringUtils
import qualified System.Random         as Random

escapeChars = [("\\n", "\n"), ("\\r", "\r"), ("\\t", "\\t")]

swap' :: Char -> [Char] -> [Char] -> [Char]
swap' _ _ [] = []
swap' this with (x:xs) = swapped ++ (swap' this with xs)
    where swapped = 
            if x == this
            then with
            else [x]

swap :: Char -> [Char] -> [Char] -> Char8.ByteString
swap this with image = Char8.pack . swap' this with $ image

