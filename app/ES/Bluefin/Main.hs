module ES.Bluefin.Main
    ( runBluefin
    ) where

import Bluefin.IO
import Bluefin.Reader
import Bluefin.State
import Common
import ES.Bluefin.Target

runBluefin :: Behavior -> IO ()
runBluefin b =
  runEff $ \io ->
    evalState 0 $ \s ->
      runReader '?' $ \_ ->
        runReader '?' $ \_ ->
          runReader '?' $ \_ ->
            runReader '?' $ \_ ->
              runReader '?' $ \_ ->
                runReader '?' $ \_ ->
                  runReader '?' $ \_ ->
                    runReader '?' $ \_ ->
                      runReader '?' $ \_ ->
                        runReader '?' $ \_ ->
                          runReader '?' $ \_ ->
                            runReader '?' $ \_ ->
                              runReader '?' $ \_ ->
                                runReader '?' $ \_ ->
                                  runReader '?' $ \_ ->
                                    runReader '?' $ \_ ->
                                      runReader '?' $ \_ ->
                                        runReader '?' $ \_ ->
                                          runReader '?' $ \_ ->
                                            runReader '?' $ \_ ->
                                              target io s b
