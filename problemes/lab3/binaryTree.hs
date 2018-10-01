data Tree a = Node a (Tree a) (Tree a) | Empty deriving (Show)

size :: Tree a -> Int
size Empty = 0
size (Node _ a b) = 1 + size a + size b

height :: Tree a -> Int
height Empty = 0
height (Node _ a b) = 1 + max (height a) (height b)

equal :: Eq a => Tree a -> Tree a -> Bool
equal Empty Empty = True
equal Empty (Node _ _ _) = False
equal (Node _ _ _) Empty = False
equal (Node a1 b1 c1) (Node a2 b2 c2) = a1 == a2 && equal b1 b2 && equal c1 c2

isomorphic :: Eq a => Tree a -> Tree a -> Bool
isomorphic Empty Empty = True
isomorphic Empty (Node _ _ _) = False
isomorphic (Node _ _ _) Empty = False
isomorphic (Node a1 b1 c1) (Node a2 b2 c2) = a1 == a2 && ((equal b1 b2 && equal c1 c2) || (equal b1 c2 && equal c1 b2))

preOrder :: Tree a -> [a]
preOrder Empty = []
preOrder (Node x a b) = [x] ++ (preOrder a) ++ (preOrder b)

postOrder :: Tree a -> [a]
postOrder Empty = []
postOrder (Node x a b) = (postOrder a) ++ (postOrder b) ++ [x]

inOrder :: Tree a -> [a]
inOrder Empty = []
inOrder (Node x a b) = (inOrder a) ++ [x] ++ (inOrder b)

breadthFirst :: Tree a -> [a]
breadthFirst Empty = []
breadthFirst a =  breadthFirst' [a]

breadthFirst' :: [Tree a] -> [a]
breadthFirst' [] = []
breadthFirst' (Empty:xs) = breadthFirst' xs
breadthFirst' ((Node x fe fd):xs) = x : breadthFirst' (xs ++ [fe,fd])

build :: Eq a => [a] -> [a] -> Tree a
build [] [] = Empty
build p@(px : pxs) i = Node px (build lp li) (build rp ri)
  where (li,_:ri) = span (/=px) i
        (lp,rp) = splitAt (length li) pxs

overlap :: (a -> a -> a) -> Tree a -> Tree a -> Tree a
overlap _ Empty Empty = Empty
overlap _ a Empty = a
overlap _ Empty b = b
overlap f (Node ax al ar) (Node bx bl br) = Node (f ax bx) (overlap f al bl) (overlap f ar br)
