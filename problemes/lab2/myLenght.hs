myLength :: String -> Int

myLength = foldl (const . (+1)) 0
-- sum $ map const(1) xs 
-- last $ zip xs [1..]