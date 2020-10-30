module Types.Game (
  DrawLine,
  PlayGrid
) where

-- | Возможные ходы игрока
data DrawLine =
    Vertical Int Int    -- | соединить точки горизонтально
  | Horizontal Int Int -- | соединить точки вертикально
  deriving (Eq,Show,Read)


-- | Добавить квадрат первому игроку
 setBoxesFirst :: Int -- ^ Текущее количество квадратов
                     -> GameState   -- ^ Старое состояние игры
                     -> GameState   -- ^ Новое состояние
setBoxesFirst c gs = gs { boxesFirst = c + 1 }

-- | Добавить квадрат второму игроку
 setBoxesSecond :: Int -- ^ Текущее количество квадратов
                     -> GameState   -- ^ Старое состояние игры
                     -> GameState   -- ^ Новое состояние
setBoxesSecond c gs = gs { boxesSecond = c + 1

