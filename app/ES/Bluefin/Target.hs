module ES.Bluefin.Target
    ( target
    ) where

import Bluefin.Eff
import Bluefin.IO
import Bluefin.State
import Common

target ::
    forall (e0 :: Effects) (e1 :: Effects) (es :: Effects).
    (e0 :> es, e1 :> es) =>
    IOE e0 ->
    State Int e1 ->
    Behavior ->
    Eff es ()
target io s = mkTarget (effIO io) (get s) (put s)
