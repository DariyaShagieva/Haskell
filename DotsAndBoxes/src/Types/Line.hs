-- | Линии

module Types.Line where

-- | Линия имеет начальную координату и направление (вертикальная или горизонтальная)
data Line = Line
{
startPoint::[Int]
direction::String
}deriving(Eq,Show,Read)