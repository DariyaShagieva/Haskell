-- | Функции для игры

module Game where

import Types

-- | сменить игрока
changePlayer :: Int -> Int
changePlayer 1 = 2
changePlayer 2 = 1

-- | закрашивание линий игроком
paintLine:: Line -> Int -> Either String GameState

-- | проверка на наличие квадрата после проведения линии
checkTriangle:: Line -> Bool

-- | Игровое поле
data PlayGrid = PlayGrid [[Int]]
deriving (Eq,Show,Read)

-- | Выигрыш наступает, когда все точки соединены

-- | Состояние игры
data GameState = GameState
  { boxesFirst :: Int
    -- ^ количество квадратов первого игрока
  , boxesSecond :: Int
    -- ^ количество квадратов второго игрока
  , grid = PlayGrid
  } deriving (Eq,Show,Read,Generic)

-- | Начальное состояние игры
initialState :: GameState
initialState = GameState
  { boxesFirst = 0,
    boxesSecond = 0,
    lines = ,
    grid =
  }
