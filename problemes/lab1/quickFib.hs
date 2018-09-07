quickFib :: Int -> Int

quickFib n = fst (quickFib' n)

quickFib' :: Int -> (Int , Int)

quickFib' 0 = (0,0)
quickFib' 1 = (1,0)
quickFib' n = (fn, fn1)
	where
		(fn1, fn2) = quickFib' (n-1)
		fn = fn1 + fn2