-- | Функции для игры

module Game where

import Types

-- | сменить игрока
changePlayer :: Int -> Int
changePlayer 1 = 2
changePlayer 2 = 1

-- | Начальное состояние игры
initialState :: GameState
initialState = GameState
  { boxesFirst = 0,
    boxesSecond = 0
  }
