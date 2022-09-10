
-- =============== DO NOT MODIFY ===================

{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE FlexibleInstances #-}

-- ==================================================

module Tasks where

import Dataset
import Data.List
import Text.Printf
import Data.Array

type CSV = String
type Value = String
type Row = [Value]
type Table = [Row]
type ColumnName = String

-- Prerequisities
split_by :: Char -> String -> [String]
split_by x = foldr op [""]
  where op char acc
            | char == x = "":acc
            | otherwise = (char:head(acc)):tail(acc)

read_csv :: CSV -> Table
read_csv = (map (split_by ',')) . (split_by '\n')

write_csv :: Table -> CSV
write_csv = (foldr (++) []).
            (intersperse "\n").
            (map (foldr (++) [])).
            (map (intersperse ","))


{-
    TASK SET 1
-}

toString ::[Int] -> [String]
toString = map (printf "%d")

toInt :: [String] ->[Int]
toInt = map (read :: String -> Int) 

toFloat :: [String] -> [Float]
toFloat = map (read :: String -> Float)


-- Task 1

media_t1 :: [String] -> String
media_t1 xs = printf "%.2f" (a / b) 
            where a = fromIntegral (foldr (+) 0 (toInt xs)) :: Float
                  b = fromIntegral 8 :: Float 

create_row_t1 :: Row -> Row
create_row_t1 xs = (head xs) : [media_t1 (tail xs)]

compute_average_steps :: Table -> Table
compute_average_steps m = ["Name","Average Number of Steps"] : (map create_row_t1 (tail m))


-- Task 2

-- Number of people who have achieved their goal:
suma :: Row -> Int
suma xs = foldr (+) 0 (toInt xs)

get_passed_people_num :: Table -> Int
get_passed_people_num m = foldr (+) 0 (map check m)
                            where check xs = if (suma (tail xs)) > 1000 then 1 else 0
                              


-- Percentage of people who have achieved their:

get_passed_people_percentage :: Table -> Float
get_passed_people_percentage m = a / b
                                  where a = fromIntegral (get_passed_people_num m) :: Float
                                        b = fromIntegral (length m) :: Float

-- Average number of daily steps

suma_medii :: Table -> Float
suma_medii m = foldr (+) 0 (toFloat (map last (tail (compute_average_steps m))))

get_steps_avg :: Table -> Float
get_steps_avg m = a / b
                  where a = (suma_medii m) * 8
                        b = fromIntegral (length (tail m)) :: Float

                
-- Task 3

media_t3 :: [String] -> String
media_t3 xs = printf "%.2f" (a / b) 
            where a = fromIntegral (suma xs) :: Float
                  b = fromIntegral (length xs) :: Float

get_avg_steps_per_h :: Table -> Table
get_avg_steps_per_h m =  ["H10","H11","H12","H13","H14","H15","H16","H17"] : [(map media_t3 (tail (transpose (tail m))))]


-- Task 4
range1 ::[Int] ->Int
range1 [] = 0
range1 (x:xs) = if (x >= 0 && x < 50) then 1 + range1 xs else range1 xs

range2 ::[Int] ->Int
range2 [] = 0
range2 (x:xs) = if (x >= 50 && x < 100) then 1 + range2 xs else range2 xs

range3 ::[Int] ->Int
range3 [] = 0
range3 (x:xs) = if (x >= 100 && x < 500) then 1 + range3 xs else range3 xs


trunc_list :: [[String]] -> [[String]]
trunc_list list = map tail list
 
compute_activity :: [[String]] -> [[Int]]
compute_activity m = map toInt (tail(tail(transpose (trunc_list(tail m)))))

create_VeryActiveMinutes :: [[String]] -> [String]
create_VeryActiveMinutes m = ["VeryActiveMinutes"] ++ (toString ([range1(head(compute_activity m))] ++ [range2(head(compute_activity m))] ++ [range3(head(compute_activity m))]))

create_FairlyActiveMinutes :: [[String]] -> [String]
create_FairlyActiveMinutes m = ["FairlyActiveMinutes"] ++ (toString ([range1(head(tail(compute_activity m)))] ++ [range2(head(tail(compute_activity m)))] ++ [range3(head(tail(compute_activity m)))]))

create_LightlyActiveMinutes :: [[String]] -> [String]
create_LightlyActiveMinutes m = ["LightlyActiveMinutes"] ++ (toString ([range1(last(compute_activity m))] ++ [range2(last(compute_activity m))] ++ [range3(last(compute_activity m))]))

get_activ_summary :: Table -> Table
get_activ_summary m =  ["column", "range1", "range2", "range3"] : ([(create_VeryActiveMinutes m), (create_FairlyActiveMinutes m), (create_LightlyActiveMinutes m)])


-- Task 5
alpha_order s1 s2 
                |s1 > s2 = GT
                |s1 == s2 = EQ 
                |otherwise = LT

myCompare :: [String] -> [String] -> Ordering
myCompare xs ys
                | (read (last xs) :: Float) > (read (last ys) :: Float) = GT 
                | (read (last xs) :: Float) < (read (last ys) :: Float) = LT
                | otherwise = (alpha_order (head xs) (head ys))



myinsertBy :: ([String] -> [String] -> Ordering) -> [String] -> [[String]] -> [[String]]
myinsertBy comparator x [] = [x]
myinsertBy comparator x (y:ys) 
                            | comparator x y == LT = x : y : ys
                            | otherwise = y : (myinsertBy comparator x ys) 
 
insertSortBy :: ([String] -> [String] -> Ordering ) -> [[String]] -> [[String]]
insertSortBy comparator [] = []
insertSortBy comparator (y:ys) = myinsertBy comparator y (insertSortBy comparator ys)

create_list :: [String] -> [String]
create_list list = [(head list)] ++ [(head(tail list))]

create_unsorted_table :: [[String]] -> [[String]]
create_unsorted_table m = map create_list m

get_ranking :: Table -> Table
get_ranking m =  ["Name", "Total Steps"] : (insertSortBy myCompare (tail (create_unsorted_table m)))


-- Task 6

mediat6 :: [Int] -> Float
mediat6 xs = a / b
            where 
                a = fromIntegral (foldr (+) 0 xs) :: Float
                b = fromIntegral 4 :: Float

create_row_t6 :: [String] -> [String]
create_row_t6 xs = (head xs) : [(printf "%.2f" (mediat6 (toInt (take 4 (tail xs))))),( printf "%.2f" (mediat6 (toInt (drop 5 xs)))), (printf "%.2f" (diference))]
                where diference
                            |((mediat6 (toInt (take 4 (tail xs)))) > (mediat6 (toInt (drop 5 xs)))) = (mediat6 (toInt (take 4 (tail xs)))) - (mediat6 (toInt (drop 5 xs)))
                            |otherwise = (mediat6 (toInt (drop 5 xs))) - (mediat6 (toInt (take 4 (tail xs))))

get_steps_diff_table :: Table -> Table
get_steps_diff_table m =  ["Name","Average first 4h","Average last 4h","Difference"]:(insertSortBy myCompare (map create_row_t6 (tail m)))


-- Task 7

-- Applies the given function to all the values
vmap :: (Value -> Value) -> Table -> Table
vmap f m = map (map f) m


-- Task 8

-- Applies the given function to all the entries
rmap :: (Row -> Row) -> [String] -> Table -> Table
rmap f s m = s : (map f m)


get_sleep_total :: Row -> Row
get_sleep_total r = (head r) : [(printf "%.2f" (fromIntegral (foldr (+) 0 (toInt (tail r))) :: Float))]



{-
    TASK SET 2
-}

-- Task 1
myCompare2 :: [String] -> [String] -> Int -> Ordering
myCompare2 xs ys nr
                | (read (last (take nr xs)) :: Float) > (read (last (take nr ys)) :: Float) = GT 
                | (read (last (take nr xs)) :: Float) < (read (last (take nr ys)) :: Float) = LT
                | otherwise = (alpha_order (head xs) (head ys))

myinsertBy2 :: ([String] -> [String] -> Int -> Ordering) -> Int -> [String] -> [[String]] -> [[String]]
myinsertBy2 comparator nr x [] = [x]
myinsertBy2 comparator nr x (y:ys) 
                            | comparator x y nr == LT = x : y : ys
                            | otherwise = y : (myinsertBy2 comparator nr x ys) 
 
insertSortBy2 :: ([String] -> [String] -> Int -> Ordering ) -> Int -> [[String]] -> [[String]]
insertSortBy2 comparator nr [] = []
insertSortBy2 comparator nr (y:ys) = myinsertBy2 comparator nr y (insertSortBy2 comparator nr ys)

countCol :: String -> [String] -> Int -> Int 
countCol name [] nr = 0
countCol name list nr = if (name == head(list)) then nr + 1 else countCol name (tail list) (nr + 1) 

tsort :: ColumnName -> Table -> Table
tsort column table = (head table) : (insertSortBy2 myCompare2 nr (tail table))
    where nr = countCol column (head table) 0


-- Task 2

compareHeader :: [String] -> [String] -> Int
compareHeader [] [] = 1
compareHeader [] y = 0
compareHeader x [] = 0
compareHeader x y = if (head x) == (head y) then compareHeader (tail x) (tail y) else 0


vunion :: Table -> Table -> Table
vunion t1 t2 = if compareHeader (head t1) (head t2) == 1 then t1 ++ (tail t2) else t1

-- Task 3
makeEmpty :: Int -> [String] -> [String]
makeEmpty 0 xs = xs
makeEmpty k xs = makeEmpty (k - 1) (xs ++ [""])

completer :: [[String]] -> Int -> [[String]] 
completer t 0 = t
completer t k = completer (t ++ [(makeEmpty (length (head t)) [] )]) (k - 1) 

unionSameLen :: [[String]] -> [[String]] -> [[String]]
unionSameLen [] [] = []
unionSameLen t1 t2 = ((head t1) ++ (head t2)) : (unionSameLen (tail t1) (tail t2))

hunion :: Table -> Table -> Table
hunion t1 t2 
            | (length t1) < (length t2) = unionSameLen (completer t1 (length t2 - length t1)) t2
            | (length t2) < (length t1) = unionSameLen t1 (completer t2 (length t1 - length t2))
            | otherwise = unionSameLen t1 t2
-- Task 4

compareKey :: Int -> [String] -> [String] -> Bool
compareKey nr list1 list2 = if (list1 !! (nr - 1)) == (list2 !! (nr - 1)) then True else False
    
merge :: [String] -> [String] -> [String]
merge [] list2 = []
merge list1 [] = []
merge list1 list2 = [(head list1)] ++ (tail list1) ++ (tail list2)

findCol :: Int -> [String] -> [[String]] -> [String]
findCol nr list [] = []
findCol nr list t = if (compareKey nr list (head t)) then head t else findCol nr list (tail t)

joinRec :: Int-> [[String]] -> [[String]] -> [[String]]
joinRec nr [] t2 = []
joinRec nr t1 t2 = if (findCol nr (head t1) t2) == [] then joinRec nr (tail t1) t2 else (merge (head t1) (findCol nr (head t1) t2)) : (joinRec nr (tail t1) t2)

tjoin :: ColumnName -> Table -> Table -> Table
tjoin key_column t1 t2 = joinRec nr t1 t2
    where nr = countCol key_column (head t1) 0

-- Task 5
helper :: (Row -> Row -> Row) -> Table -> Table -> Table
helper func t1 [] = []
helper func [] t2 = []
helper func t1 t2 = (func (head t1) (head t2)) : (helper func t1 (tail t2))

helper2 :: (Row -> Row -> Row) -> Table -> Table -> Table
helper2 func [] [] = []
helper2 func [] t2 = []
helper2 func t1 t2 = (helper func t1 t2) ++ (helper2 func (tail t1) t2)

cartesian :: (Row -> Row -> Row) -> [ColumnName] -> Table -> Table -> Table
cartesian new_row_function new_column_names t1 t2 = new_column_names : (helper2 new_row_function (tail t1) (tail t2))

-- Task 6
extract :: String -> [[String]] -> [[String]]
extract name t = map (drop (nr - 1)) (map (take nr) t)
        where nr = countCol name (head t) 0

projection :: [ColumnName] -> Table -> Table
projection [] t = []
projection listName t = if length listName > 1 then unionSameLen (extract (head listName) t) (projection (tail listName) t) else (extract (head listName) t)

-- Task 7

filterTable :: (Value -> Bool) -> ColumnName -> Table -> Table
filterTable condition key_column t = (head t) : (filter (\x -> condition (x !! (nr - 1))) (tail t))
                where nr = countCol key_column (head t) 0

