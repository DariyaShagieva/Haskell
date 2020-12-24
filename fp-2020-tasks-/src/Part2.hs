module Part2 where

import Part2.Types
import Data.Function ((&))
import Control.Monad (msum)

------------------------------------------------------------
-- PROBLEM #6
--
-- Написать функцию, которая преобразует значение типа
-- ColorLetter в символ, равный первой букве значения
prob6 :: ColorLetter -> Char
prob6 cl = case cl of
    RED -> 'R'
    GREEN -> 'G'
    BLUE -> 'B'

------------------------------------------------------------
-- PROBLEM #7
--
-- Написать функцию, которая проверяет, что значения
-- находятся в диапазоне от 0 до 255 (границы входят)
prob7 :: ColorPart -> Bool
prob7 cp = prob9 cp <= 255 && prob9 cp >=0

------------------------------------------------------------
-- PROBLEM #8
--
-- Написать функцию, которая добавляет в соответствующее
-- поле значения Color значение из ColorPart
prob8 :: Color -> ColorPart -> Color
prob8 c cp = case cp of
    (Red n) -> c {red = (red c) + n}
    (Blue n) -> c {blue = (blue c) + n}
    (Green n) -> c {green = (green c) + n}

------------------------------------------------------------
-- PROBLEM #9
--
-- Написать функцию, которая возвращает значение из
-- ColorPart
prob9 :: ColorPart -> Int
prob9 cp = case cp of
    (Red n) -> n
    (Blue n) -> n
    (Green n) -> n

------------------------------------------------------------
-- PROBLEM #10
--
-- Написать функцию, которая возвращает компонент Color, у
-- которого наибольшее значение (если такой единственный)
prob10 :: Color -> Maybe ColorPart
prob10 c | red c > green c && red c > blue c = Just  (Red (red c))
         | green c > red c && green c > blue c = Just  (Green (green c))
         | blue c > red c && blue c > green c = Just  (Blue (blue c))
prob10 c = Nothing

------------------------------------------------------------
-- PROBLEM #11
--
-- Найти сумму элементов дерева
prob11 :: Num a => Tree a -> a
prob11 tree =
    maybe 0 prob11 (tree & left) +
    maybe 0 prob11 (tree & right) +
    (tree & root)

------------------------------------------------------------
-- PROBLEM #12
--
-- Проверить, что дерево является деревом поиска
-- (в дереве поиска для каждого узла выполняется, что все
-- элементы левого поддерева узла меньше элемента в узле,
-- а все элементы правого поддерева -- не меньше элемента
-- в узле)
prob12 :: Ord a => Tree a -> Bool
prob12 (Tree Nothing _ Nothing) = True
prob12 (Tree (Just l) v Nothing) = all (< v) (flatten l) && prob12 l
prob12 (Tree Nothing v (Just r)) = all (>= v) (flatten r) && prob12 r
prob12 (Tree (Just l) v (Just r)) = prob12 (Tree (Just l) v Nothing) && prob12 (Tree Nothing v (Just r))

flatten :: Tree a -> [a]
flatten (Tree Nothing v Nothing) = [v]
flatten (Tree (Just l) v Nothing) = flatten l ++ [v]
flatten (Tree Nothing v (Just r)) = v : flatten r
flatten (Tree (Just l) v (Just r)) = flatten l ++ v : flatten r

------------------------------------------------------------
-- PROBLEM #13
--
-- На вход подаётся значение и дерево поиска. Вернуть то
-- поддерево, в корне которого находится значение, если оно
-- есть в дереве поиска; если его нет - вернуть Nothing
prob13 :: Ord a => a -> Tree a -> Maybe (Tree a)
prob13 value tree
    | value == (tree & root) = Just tree
    | otherwise = msum
        [
            do
                leftTree <- tree & left
                prob13 value leftTree,
            do
                rightTree <- tree & right
                prob13 value rightTree
        ]

------------------------------------------------------------
-- PROBLEM #14
--
-- Заменить () на числа в порядке обхода "правый, левый,
-- корень", начиная с 1
prob14 :: Tree () -> Tree Int
prob14 tree = case enumerate (Just tree) 1 of
    (Just enumerated, _) -> enumerated

enumerate :: Maybe (Tree ()) -> Int -> (Maybe (Tree Int), Int)
enumerate Nothing i = (Nothing, i)
enumerate (Just (Tree l () r)) i = (Just $ Tree l' current r', current + 1)
    where
        (r', afterRight) = enumerate r i
        (l', afterLeft) = enumerate l afterRight
        current = afterLeft

------------------------------------------------------------
-- PROBLEM #15
--
-- Выполнить вращение дерева влево относительно корня
-- (https://en.wikipedia.org/wiki/Tree_rotation)
prob15 :: Tree a -> Tree a
prob15 tree = maybe tree rotation $ tree & right
    where
        rotation rightTree = rightTree {left = Just (tree {right = rightTree & left})}


------------------------------------------------------------
-- PROBLEM #16
--
-- Выполнить вращение дерева вправо относительно корня
-- (https://en.wikipedia.org/wiki/Tree_rotation)
prob16 :: Tree a -> Tree a
prob16 tree = maybe tree rotation $ tree & left
    where
        rotation leftSubTree = leftSubTree {right = Just (tree {left = leftSubTree & right})}

------------------------------------------------------------
-- PROBLEM #17
--
-- Сбалансировать дерево поиска так, чтобы для любого узла
-- разница высот поддеревьев не превосходила по модулю 1
-- (например, преобразовать в полное бинарное дерево)
prob17 :: Tree a -> Tree a
prob17 = error "Implement me!"
