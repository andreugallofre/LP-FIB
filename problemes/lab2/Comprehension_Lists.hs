myMap :: (a -> b) -> [a] -> [b]
myMap f x = [f Matrix | Matrix<- x]

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f x = [Matrix | Matrix<-x , f Matrix]

myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith f x y = [f n m | (n,m)<- zip x y]

thingify :: [Int] -> [Int] -> [(Int, Int)]
thingify x y = [ (n,m) |n<-x, m<-y, mod n m == 0 ]


factors :: Int -> [Int]
factors x = [m | m<- [1..x], mod x m == 0]
