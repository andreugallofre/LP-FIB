{- absValue n = 
	if n < 0 then -n
	else  n -}

{- power x y
	| y == 0 = 1
	| y == 1 = x
	| y `mod` 2 == 0 = power (power x (y `div` 2)) 2
	| otherwise = power (x*x) y-1 -}

{- power x n
	| even n = (power x (div n 2)) * (power x (div n 2))
	| odd n = x * (power x (div n 2)) * (power x (div n 2))-}