module Types.Game (
  drawLine,
  PlayGrid
) where

-- | Состояние игры
data GameState = GameState
  { boxesFirst :: Int
    -- ^ количество квадратов первого игрока
  , boxesSecond :: Int
    -- ^ количество квадратов второго игрока
  } deriving (Eq,Show,Read,Generic)

-- | Возможные ходы игрока
data drawLine =
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
setBoxesSecond c gs = gs { boxesSecond = c + 1 }

-- | Игровое поле
data PlayGrid = PlayGrid [[Int]]
deriving (Eq,Show,Read)

-- | Выигрыш наступает, когда все точки соединены

-- | Состояние игры
data GameState = GameState
  { grid :: PlayGrid }
   deriving (Eq,Show,Read)
