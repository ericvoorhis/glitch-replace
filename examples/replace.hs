import qualified Salad.Image as Salad
import qualified Data.ByteString.Char8 as Char8
import System.IO

main = do 

    -- Filepath for image to be altered by GlithReplace 
    let filepath = "../info/forest.bmp"
    
    -- Open image file in character representation
    handle   <- openFile filepath ReadMode
    contents <- hGetContents handle
    let image = contents

    -- Replaces'\n' with '\r\n'
    let alteredImage = Salad.swap '\n' "\r\n" image

    -- Save the file
    let newfilepath = "../info/forestReplaced.bmp" 
    Char8.writeFile newfilepath alteredImage

    -- Close the handle, and we're done ✨
    hClose handle

