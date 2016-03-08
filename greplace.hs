import System.IO
import System.Environment
import Data.Char
import qualified Data.ByteString.Char8 as B
import Data.String.Utils
import qualified System.Random as R

print_ a = do
    mapM_ (print) a
    putStrLn "\n"

escape_chars = [("\\n", "\n"), ("\\r", "\r"), ("\\t", "\t")]

cycleThrough :: [(String, String)] -> String -> String
cycleThrough [] s = s
cycleThrough ((match, sub):rest) str = cycleThrough rest new_str
    where new_str = replace match sub str

replaceWith :: Char -> [Char] -> [Char] -> [Char]
replaceWith match sub [] = []
replaceWith match sub (x:xs)
    | x == match = sub ++ (replaceWith match sub xs)
    | otherwise = [x] ++ (replaceWith match sub xs)


main = do
    -- get command-line arguments
    args <- getArgs
    let filePath = args !! 0

    -- Open image file in character representation
    handle <- openFile filePath ReadMode
    contents <- hGetContents handle
    let image = contents
    -- Clean extra '\' from escape characters such as '\n' so that they aren't '\\n'
    let new_args = map (cycleThrough (escape_chars)) args
    let match = new_args !! 1 !! 0
    let substitute = new_args !! 2

    let new_image = B.pack $ replaceWith match substitute image

    let stamp = "1"
    let parts = split "." filePath
    let new_filePath = (parts !! 0) ++ stamp ++ "." ++ (parts !! 1)

    B.writeFile new_filePath new_image

    hClose handle
