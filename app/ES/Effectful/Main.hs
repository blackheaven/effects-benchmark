module ES.Effectful.Main
    ( runEffectful
    ) where

import Effectful
import Effectful.Reader.Static
import Effectful.State.Static.Local
import ES.Effectful.Target
import Common

runEffectful :: Behavior -> IO ()
runEffectful =
  runEff
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
