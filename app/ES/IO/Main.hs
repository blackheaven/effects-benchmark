module ES.IO.Main
    ( runIO
    ) where

import Common
import ES.IO.Target
import Data.IORef

runIO :: Behavior -> IO ()
runIO b = do
  ref <- newIORef 0
  target ref b
