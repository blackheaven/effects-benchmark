module Common
  ( Behavior (..)
  , ioOfMs
  , pureComputation
  , mkTarget
  , fib
  , onceEvery
  ) where

import Control.Concurrent
import Control.Exception
import Control.Monad

onceEvery :: Int -> (Int -> IO ()) -> Int -> IO ()
onceEvery freq f n =
  when (mod n freq == 0) $
    f n

ioOfMs :: Int -> Int -> IO ()
ioOfMs delay _ = threadDelay $ delay * 1000

-- Collatz conjecture
pureComputation :: Int -> Int -> IO ()
pureComputation start x = void $ evaluate $ x + read (fib $ show start)

fib :: String -> String
fib =
  \case
    "0" -> "0"
    "1" -> "1"
    n -> show $ read @Int (fib $ show $ read @Int n - 1) + read (fib $ show $ read @Int n - 2)

data Behavior = Behavior { loops :: Int, action :: Int -> IO () }

mkTarget ::
  Monad m =>
  (IO () -> m ()) -> -- lift computation
  m Int -> -- read counter
  (Int -> m ()) -> -- set counter
  Behavior ->
  m ()
mkTarget embed getCounter setCounter Behavior {..} = go
  where go = do
          n <- getCounter
          when (n < loops) $ do
            embed $ action n
            setCounter $ n + 1
            go
