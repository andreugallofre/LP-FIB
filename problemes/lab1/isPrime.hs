isPrime :: Int -> Bool

isPrime 1 = False
isPrime n = not (hasDivisor n 2)
	where
		hasDivisor :: Int -> Int -> Bool
		hasDivisor n c
			| c ==  n = False
			| mod n c == 0 = True
			| otherwise = hasDivisor n (c+1)
