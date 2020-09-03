module Main where

import qualified Graphics.UI.Threepenny as Ui
import Graphics.UI.Threepenny.Core
import Data.Function ((&))
import Data.Functor (void)

main :: IO ()
main = startGUI defaultConfig setup

setup :: Window -> UI ()
setup window =
  void $
    do
      clickButton <- Ui.button & set text "click"
      toggleButton <- Ui.button & set text "toggle display"
      clickCount <- (fmap . fmap) show (accumB 0 (succ <$ Ui.click clickButton))
      getBody window #+
        [
          element clickButton,
          Ui.br,
          element toggleButton,
          Ui.div
            & sink text clickCount
        ]
