-- | Функции для игры

module Game where

import Types

-- | Начальное состояние игры
initialState :: GameState
initialState = GameState
  { boxesFirst = 0,
    boxesSecond = 0
  }
