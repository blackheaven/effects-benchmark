{-# OPTIONS_GHC -fplugin=Polysemy.Plugin #-}
module ES.Polysemy.Main
    ( runPolysemy
    ) where

import Polysemy
import Polysemy.Reader
import Polysemy.State
import ES.Polysemy.Target
import Common

runPolysemy :: Behavior -> IO ()
runPolysemy =
  runM
    . evalState 0
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
