module Types.Game (
  drawLine,
  PlayGrid
) where

-- | Возможные ходы игрока
data drawLine =
    Vertical Int Int    -- | соединить точки горизонтально
  | Horizontal Int Int -- | соединить точки вертикально
  deriving (Eq,Show,Read)


-- | Игровое поле
data PlayGrid = PlayGrid [[Int]]
deriving (Eq,Show,Read)

-- | Выигрыш наступает, когда все точки соединены

-- | Состояние игры
data GameState = GameState
  { grid :: PlayGrid }
   deriving (Eq,Show,Read)
