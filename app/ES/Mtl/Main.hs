module ES.Mtl.Main
    ( runMtl
    ) where

import Common
import Control.Monad.Reader
import Control.Monad.State.Strict
import ES.Mtl.Target

runMtl :: Behavior -> IO ()
runMtl =
  flip evalStateT 0
    . flip runReaderT '?'
    . flip runReaderT '?'
    . flip runReaderT '?'
    . flip runReaderT '?'
    . flip runReaderT '?'
    . flip runReaderT '?'
    . flip runReaderT '?'
    . flip runReaderT '?'
    . flip runReaderT '?'
    . flip runReaderT '?'
    . flip runReaderT '?'
    . flip runReaderT '?'
    . flip runReaderT '?'
    . flip runReaderT '?'
    . flip runReaderT '?'
    . flip runReaderT '?'
    . flip runReaderT '?'
    . flip runReaderT '?'
    . flip runReaderT '?'
    . flip runReaderT '?'
    . target
