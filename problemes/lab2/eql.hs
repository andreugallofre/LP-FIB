eql :: [Int] -> [Int] -> Bool

eql xs ys = (and $ zipWith (==) xs ys) && length xs == length ys