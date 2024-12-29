module ES.Effectful.Target
    ( target
    ) where

import Common
import Effectful
import Effectful.State.Static.Local

target ::
    (State Int :> es, IOE :> es) =>
    Behavior ->
    Eff es ()
target = mkTarget liftIO get put
