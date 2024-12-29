module ES.FusedEffects.Target
    ( target
    ) where

import Common
import Control.Algebra
import Control.Effect.Lift
import Control.Effect.State

target ::
    (Has (State Int) sig m, Has (Lift IO) sig m) =>
    Behavior ->
    m ()
target = mkTarget sendIO get put
