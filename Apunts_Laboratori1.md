# Introducció a Haskell - Laboratori 1 Llenguatges de programació

## Informació general

En els cas de Haskell tenim que es un llenguatge que sempre respecta els tipus i que no podem fer coses rares amb ells com fariem per exemple en Javascript i PHP

Si volem posar un char el posarem entre '' i en el cas d'un string entre "" 

#### Coses útils

Quan fem servir l'interpret de Haskell tenim varies "comandes" interessants.

```:load program_name.hs``` 

Ens permet carregar un programa per poder-lo fer servir, en cas que volguem recarregarlo després de fer canvis farem servir

```:reload o :r```

## Funcions en Haskell 

Les funcions en haskell es declaren posant el nom seguit de :: i després els tipus d'entrada i sortida que tindrà.

```fact :: Integer -> Integer```

En aquest cas, la funció fact (Factorial) rep un integer i retorna un integer 

#### Exemple de tipus de les variables

Int -> integer de 32bits
Integer -> integer de 64bits

## Canvis respecte llenguatges no funcionals

La diferència bàsica entre Haskell i els llenguatges no funcionals, és que no tenim assignacions, les coses son com son i ja. A més a més, no tenim bucles, per tant tota la programació estarà basada en la recursivitat.

## IF -> THEN -> ELSE 

A haskell tenim la opció del if/then/else

```
if BOOLEAN then EXPRESSIÓ
else EXPRESSIÓ
```

Pero habitualment per ser el mes haskelià possible farem servir pattern matching a partir de la primera opció que tenim

Aixi mateix, en cas de necesitar alguna cosa més farem servir les guardes i finalment en cas de que no sigui suficent farem servir el if/then/else

## Funcions amb més d'un paràmetre

Si necesitem més d'un paràmetre el que farem serà simplement afegir "fletxes" i tipus i ja

En el cas de Haskell, només tenim funcions amb un paràmetre, llavors el que pasarà es que les funcions estaran composades d'altres funcions

```pot :: Int -> (Int -> Int)```

## Funcions inplace com a funcions "normals" 

```True && False == (&&) True False```

Les funcions "amb lletres" les podem fer servir com a funcions infixes (posarles entre mig dels "parametres") posant-les entre ` com per exemple 

```2 `pot` 3 ```

## Variables de tipus

Quan fem servir variables entre mig que començen en minuscules, seràn variables de tipus, que després es convertiran en tipus del cas que vulguem, per exemple Int/Integer/Double/Boolean...

## Limitació de tipus en funcions "template"

Si afegim al principi Num a => Vol dir que estem limitant l'us de la funció a les clases de tipus numèric.

Per posar un altre exemple podriem usar Eq, que vol dir que pot ser equalitzable, es a dir comparat amb == o \\=

## Especificació de tipus

Si no específiquem els tipus de les coses que farem servir, haskell predirà el tipus d'aquestes, i ens ho farà de la forma mes genèrica possible de manera que ho podrem fer serivr amb els tipus més generals que puguem

## Algorismica en la programació funcional

Fent programació funcional l'algorisme es el mateix que en el cas dels altres llenguatges però s'implementarà un pèl diferent però com a base acaba sent el mate