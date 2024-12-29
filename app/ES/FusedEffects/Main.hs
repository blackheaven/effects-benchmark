module ES.FusedEffects.Main
    ( runFusedEffects
    ) where

import Control.Carrier.Lift
import Control.Carrier.Reader
import Control.Carrier.State.Strict
import ES.FusedEffects.Target
import Common

runFusedEffects :: Behavior -> IO ()
runFusedEffects =
  runM
    . evalState (0 :: Int)
    . runReader '?'
    . runReader '?'
    . runReader '?'
    . runReader '?'
    . runReader '?'
    . runReader '?'
    . runReader '?'
    . runReader '?'
    . runReader '?'
    . runReader '?'
    . runReader '?'
    . runReader '?'
    . runReader '?'
    . runReader '?'
    . runReader '?'
    . runReader '?'
    . runReader '?'
    . runReader '?'
    . runReader '?'
    . runReader '?'
    . target
