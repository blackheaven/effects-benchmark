{-# OPTIONS_GHC -fplugin=Polysemy.Plugin #-}
module ES.Polysemy.Target
    ( target
    ) where

import Common
import Polysemy
import Polysemy.State

target ::
    Members '[State Int, Embed IO] r =>
    Behavior ->
    Sem r ()
target = mkTarget embed get put
