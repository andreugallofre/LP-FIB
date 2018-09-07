llargada :: [a] -> Int

llargada [] = 0
llargada (_:xs) = 1 + llargada xs