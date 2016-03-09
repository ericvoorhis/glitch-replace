module GlitchReplace.Image
( replace
) where

import Data.Char
import qualified Data.ByteString.Char8 as B
import qualified Data.String.Utils as S
import qualified System.Random as R

escapeChars = [("\\n", "\n"), ("\\r", "\r"), ("\\t", "\t")]

print' a = do
    mapM_ (print) a
    putStrLn "\n"

cycleThrough :: [(String, String)] -> String -> String
cycleThrough xs str = foldl (replace') str xs
    where replace' bytes (match, sub) = S.replace match sub bytes

replace' :: Char -> Char -> [Char] -> [Char]
replace' match sub xs = map (\x -> if x == match then sub else x) xs

replace :: Char -> Char -> [Char] -> B.ByteString
replace swap with img = B.pack $ replace' swap with img
