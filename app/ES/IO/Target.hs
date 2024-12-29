module ES.IO.Target
    ( target
    ) where

import Common
import Data.IORef

target ::
    IORef Int ->
    Behavior ->
    IO ()
target ref = mkTarget id (readIORef ref) (writeIORef ref)
