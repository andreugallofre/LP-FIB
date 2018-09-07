power :: Int -> Int -> Int

power x 0 = 1
power x n
	| even n = z*z
	| odd n = z*z * x
	where z = power x (div n 2)