# Funcions d'ordre superior - Laboratori 2 Llenguatges de programació

## Recursivitat final

La recursivitat final o tail recursion ens permet tenir un codi que a nivell de compilador, aquest es converteix en un codi "iteratiu" fent servir simplement un "goto" que ens porta del final al principi.

Això ens pot permetre tenir funcions recursives sense tenir problemes amb desbordaments de pila.

Mes info a: 

https://www.campusmvp.es/recursos/post/Recursividad-de-cola-tail-recursion.aspx
https://stackoverflow.com/questions/33923/what-is-tail-recursion

Exemple del codi del factorial sese tail recursion

``` haskell
fact 0 = 1
fact n = n * fact (n -1)
```

En el cas d'aquesta implementació, tenim que el cost es __O(n)__ en tems i __O(n)__ en espai.

Exemple fent servir tail recursion

``` haskell
fact' 0 x = x
fact' n x = fact' (n-1) (x*n)
fact n = fact' n 1
```

Això es bàsicament el factorial implementat de manera iterativa
El codi amb un llenguatge tipus c++ seria:

``` c++
int x = 1;
while (n > 0) {
    x *= n;
    --n;
}
```

I la implementació seria en temps O(n) i espai constant

Per exemple un programa que separa una llista segons parells i senars fent servir tail recursion, en haskell quedaría de la seguent manera:

``` haskell
oNe [] = ([], [])

oNe (x:xs)
    | odd x     = x:senars, parells
    | otherwise = senars, x:parells
    where
        (senars, parells) = oNe xs
```

## Funcions d'ordre superior

Llicons.jutge.org -> "apunts" de haskell

Una funció d'ordre superior, que es una funcio que prenen com a paràmetres funcions, i retornen altres funcions.

Això en els llenguatges funcionals ens permet fer moltes coses que podriem fer amb recursivitat de forma més simple i maca.

En el cas de c++ per exemple, el sort es una funció d'ordre superior ja que li pasem una funcio d'ordenació com a paràmetres

En el cas de Haskell, una funció d'ordre superior podría ser el map

``` haskell
map even [1..10]
```

Bàsicament estem iterant sobre cada element aplicant una funció a cadascun d'ells

Fins ara haviem vist que el no tenir bucles ens obligava a fer servir recursivitat, pero ara veiem que amb les funcions d'ordre superior això no és així, i més endevant veurem altres coses que podrem fer servir.

### Exemples de funcions d'ordre superior

__Filter:__

```haskell
filter :: (a -> Bool) -> [a] -> [a]
```
ens retorna els elements d'una llista als quals li hem aplicat d'una funció i aquesta retorna true.

__Iterate:__

```haskell
iterate f x
    = [x, f(x), f(f(x)) ...]
````

ens permet aplicar una funció n vegades sobre un element

```last (take 5 iterate (*2) 1)```

ens dona 2^5 (sense el last, les 5 primeres potències de 2)

__zipWith:__

Donada una funció, una a i una b ens torna una llista de c's

Sent a,b i c tipus d'elements, que poden ser iguals o diferents segons ens interesi sempre que es puguin operar entre ells amb la funció donada.

```haskell
zipWith (+) [1,2,3] [5,1,8]

[6,3,11]
```


__Operador $__

donada una a torna una b

f $ x == f(x) -> La gràcia és que te poca prioritat, i les coses del costat s'evaluen abans que l'operador en si

Ens serveix per obrir un parèntesis i no haver-lo de tancar després, de manera que el codi queda mes llegible.

__Operador .__

```(.) f g x == f (g x) == f $ g x == (f * g) x == (f · g)```

Composició de funcions

Vindria a ser el mateix que les pipes de bash, però aplicades a la inversa, tenim una entrada que genera una sortida, i les anem ajuntant.

__Foldl/r:__

Fold el que fa es anar aplicant una funció a tots els elements d'una llista això ens pot servir per exemple per fer-ne la suma.

```
2 + 3 + 4
\   /   /
 \ /   /
  5 + 4
   \ /
    9
```

El codi en C++ ens quedaria de la seguent manera

```c++
a = 0;
for (i = 0; i < v.lenght() ; ++i)
    a = a + v[i];
```

I amb haskell ho podriem fer amb

```haskell
fold (+) 0 [3,4,8]
```
I això també ho podriem aplicar per resoldre el factorial

```haskell 
fold (*) 1 [1..n]
fact n = prod [1..n]
``` 

Tenim les versions l i r, l s'aplica des de l'esquerra, i r des de la dreta anant cap a l'esquerra

Scan fa el mateix que fold, però en lloc de retornar el valor final, ens retorna el valor intermig

Un possible exemple d'implementació d'una d'aquestes funcions podria ser:

```haskell
myZipWith :: (a->b->c) -> [a] -> [b] -> [c]

myZipWith f [] _ = []
myZipWith f _ [] = []
myZipWith f (x:xs) (y:ys) = f x y : myZipWith f xs ys
```