{-# LANGUAGE CPP #-}

module Main (main) where

import Common
import Criterion.Main
import Criterion.Types
import ES.Bluefin.Main
import ES.Effectful.Main
import ES.FusedEffects.Main
import ES.IO.Main
import ES.Mtl.Main
import ES.Polysemy.Main

main :: IO ()
main = do
  putStrLn "# Versions"
  putStrLn $ "- bluefin: " <> VERSION_bluefin
  putStrLn $ "- effectful-core: " <> VERSION_effectful_core
  putStrLn $ "- fused-effects: " <> VERSION_fused_effects
  putStrLn $ "- base: " <> VERSION_base
  putStrLn $ "- mtl: " <> VERSION_mtl
  putStrLn $ "- polysemy: " <> VERSION_polysemy

  putStrLn ""
  putStrLn "# Benchmark"
  putStrLn "## no IO/computation"
  defaultMainWith defaultConfig { reportFile = Just "results/reportNoIOComputation.html" } $ allES $ Behavior 1000 $ pureComputation 4
  putStrLn "## light computation"
  defaultMainWith defaultConfig { reportFile = Just "results/reportComputationLight.html" } $ allES $ Behavior 1000 $ pureComputation 4
  putStrLn "## heavy computation"
  defaultMainWith defaultConfig { reportFile = Just "results/reportComputationHeavy.html" } $ allES $ Behavior 1000 $ pureComputation 8
  putStrLn "## IO 1ms"
  defaultMainWith defaultConfig { reportFile = Just "results/reportIO1ms.html" } $ allES $ Behavior 1000 $ ioOfMs 1
  putStrLn "## IO 7ms"
  defaultMainWith defaultConfig { reportFile = Just "results/reportIO7ms.html" } $ allES $ Behavior 1000 $ ioOfMs 7

allES :: Behavior -> [Benchmark]
allES b = [
    bench "bluefin" $ whnfAppIO runBluefin b
  , bench "effectful-core" $ whnfAppIO runEffectful b
  , bench "fused-effects" $ whnfAppIO runFusedEffects b
  , bench "IO" $ whnfAppIO runIO b
  , bench "mtl" $ whnfAppIO runMtl b
  , bench "polysemy" $ whnfAppIO runPolysemy b
  ]
