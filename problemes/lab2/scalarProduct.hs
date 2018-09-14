scalarProduct :: [Float] -> [Float] -> Float
scalarProduct xs ys = foldl (+) 0 $ zipWith (*) xs ys