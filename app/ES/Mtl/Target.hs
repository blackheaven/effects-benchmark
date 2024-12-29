module ES.Mtl.Target
    ( target
    ) where

import Common
import Control.Monad.IO.Class
import Control.Monad.State.Strict

target ::
    (MonadIO m, MonadState Int m) =>
    Behavior ->
    m ()
target = mkTarget liftIO get put
