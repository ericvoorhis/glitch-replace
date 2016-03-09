module GlitchReplace.Image
( replace
) where

import Data.Char
import qualified Data.ByteString.Char8 as B
import Data.String.Utils
import qualified System.Random as R

escapeChars = [("\\n", "\n"), ("\\r", "\r"), ("\\t", "\t")]

print' a = do
    mapM_ (print) a
    putStrLn "\n"

cycleThrough :: (String a) => [(a, a)] -> a -> a
cycleThrough xs str = foldl (replace') str xs
    where replace' bytes (match, sub) = replace match sub bytes

replace' :: (Char a) => a -> [a] -> [a] -> [a]
replace' match sub xs = map (subMatches) xs
    where subMatches x
        | x == match = sub
        | otherwise  = x 

clean :: String -> String
clean = map (cycleThrough escapeChars)

replace :: Char -> [Char] -> [Char] -> B.ByteString
replace = B.pack $ replace'
