import qualified GlitchReplace.Image as G
import System.IO
import qualified Data.ByteString.Char8 as B

main = do 

    -- Filepath for image to be altered by GlithReplace 
    let filepath = "../info/forest.bmp"
    
    -- Open image file in character representation
    handle   <- openFile filepath ReadMode
    contents <- hGetContents handle
    let image = contents

    -- Replaces'\n' with '\r\n'
    let alteredImage = G.replace '\n' 'a' image

    -- Save the file
    let newfilepath = "../info/forestReplaced.bmp" 
    B.writeFile newfilepath alteredImage

    -- Close the handle, and we're done ✨
    hClose handle

