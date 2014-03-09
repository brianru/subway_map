module Paths_snap (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/brian/.cabal/bin"
libdir     = "/Users/brian/.cabal/lib/x86_64-osx-ghc-7.6.3/snap-0.1"
datadir    = "/Users/brian/.cabal/share/x86_64-osx-ghc-7.6.3/snap-0.1"
libexecdir = "/Users/brian/.cabal/libexec"
sysconfdir = "/Users/brian/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "snap_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "snap_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "snap_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "snap_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "snap_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
