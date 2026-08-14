# Leçons optionnelles

En plus du parcours obligatoire, ce cours propose des leçons en autonomie
pour les étudiants qui souhaitent aller plus loin. Elles ne sont pas
nécessaires pour suivre le cours, mais peuvent être utiles si un sujet vous
intéresse en particulier ou si vous voulez pratiquer davantage.

Ce document résume ce que chacune contient, pour vous aider à choisir.


## Contrôle de flux

### `Control_Flow` -- conditions et boucles

Les structures de base de tout langage de programmation : `if`/`else` pour
exécuter du code selon une condition, `for` pour répéter une action sur
chaque élément d'un vecteur, `while` pour répéter tant qu'une condition est
vraie, et les mots-clés `next`/`break` pour contrôler une boucle en cours de
route.

Utile si vous voulez comprendre comment automatiser des traitements
répétitifs, ou si vous avez déjà programmé dans un autre langage et voulez
voir la syntaxe R.


## Créer ses propres fonctions

Les leçons `Fonctions` (obligatoire) et `Manipuler_les_donnees` vous ont fait
*utiliser* des fonctions déjà existantes. Les trois leçons suivantes vous
apprennent à *créer* les vôtres.

### `Creer_des_fonctions_1` -- les bases

Définir une fonction avec `function(...)`, l'appliquer à une valeur ou à un
vecteur, fonctions à plusieurs arguments, fonctions sans argument, effets de
bord (`cat()`, `message()`), passage des arguments par position / par nom /
en mélangeant les deux, valeurs par défaut. Beaucoup d'exemples appliqués à
`hdv2003`.

### `Creer_des_fonctions_2` -- pour aller plus loin

Suite directe de la partie 1. Un détour par les listes nommées (nécessaire
pour la suite), l'argument spécial `...` qui capture un nombre variable
d'arguments, la différence entre `return()` implicite et explicite, comment
faire renvoyer plusieurs valeurs à une fonction (vecteur ou liste nommée), et
les règles de portée des variables : ce qu'une fonction peut voir de
l'extérieur, ce qu'elle ne peut pas modifier, et pourquoi.

**À faire dans l'ordre : partie 1 puis partie 2.**

### `Scripts_et_fonctions` -- variations et compléments

Couvre à nouveau certaines bases (définir une fonction, arguments par
défaut, position/nom) avec d'autres exemples, puis va sur un terrain propre :
appairage partiel des arguments, `args()` pour découvrir les arguments d'une
fonction inconnue, passer une fonction en argument d'une autre fonction,
fonctions anonymes (lambda), et la fonction `paste()`.

Le détour par les listes nommées et l'exercice sur `...` ont été retirés de
cette leçon : ils font double emploi avec `Creer_des_fonctions_2`, qui les
couvre à l'identique. La leçon y renvoie directement le moment venu.

**Peut se faire indépendamment des deux précédentes**, mais son contenu se
recoupe partiellement avec elles (arguments par défaut, position/nom) -- si
vous avez déjà fait `Creer_des_fonctions_1`, une partie vous sera familière.


## Manipulation de l'environnement R

### `Fichiers_et_espace_de_travail`

Comment R interagit avec le système de fichiers de votre ordinateur :
connaître le dossier de travail (`getwd()`), lister les objets créés dans la
session (`ls()`), lister les fichiers d'un dossier (`list.files()`,
`dir()`), créer un dossier (`dir.create()`), changer de dossier de travail
(`setwd()`). Utile si vous travaillez avec des fichiers externes (import de
données, scripts organisés en projets).



## Vecteurs et nombres aléatoires

### `Vecteurs_numériques`

Compléments à la leçon `Vecteurs` (obligatoire) : d'autres façons de créer
des vecteurs de nombres, au-delà de `c()`. L'opérateur `:`, la fonction
`seq()` (avec un pas personnalisé ou une longueur fixée), `seq_along()`, et
`rep()` pour répéter des valeurs.

### `Tirages_aleatoires`

Simuler des tirages aléatoires et des expériences probabilistes : `sample()`
(avec ou sans remise, pondéré), `rbinom()` pour une variable binomiale,
`rnorm()` pour une loi normale, `runif()` pour une loi uniforme,
`replicate()` pour répéter une simulation, et une première illustration du
théorème central limite avec un histogramme `ggplot2`. Utile si les
probabilités et la simulation vous intéressent, ou pour préparer un cours de
statistiques inférentielles.



## Exercices de synthèse

Les leçons `Exercice_1` à `Exercice_5` ne sont pas des leçons de cours, mais
des séries d'exercices sans nouveau contenu théorique : elles servent à
pratiquer ce qui a déjà été vu. Toutes utilisent `hdv2003` et le tidyverse,
comme le reste du cours.

### `Exercice_1` — vecteurs et fonctions de base

Construction de vecteurs, opérations termes à termes, valeurs manquantes
(`na.rm`), `mean()`, `sum()`, `cumsum()`, `diff()`, `pmin()`/`pmax()`. À
pratiquer après la séance 1 (`Vecteurs`, `Fonctions`).

### `Exercice_2` — découvrir et résumer un tableau

Charger `hdv2003` en tibble, `glimpse()`, `summarise()` avec plusieurs
indicateurs, `sd()`, `count()` simple et croisé. À pratiquer après
`Manipuler_les_donnees` et `Decrire_les_donnees`.

### `Exercice_3` — écrire des fonctions

Écrire des fonctions à partir d'un énoncé (périmètre, étendue, tirages
aléatoires, argument nommé), puis une série de questions sur la portée des
variables (locale/globale). À pratiquer après `Creer_des_fonctions_1` et `_2`.

### `Exercice_4` — fonctions, conditions et boucles

Combine écriture de fonctions, `if`/`else` imbriqués, et boucles `for`, sur
des énoncés plus longs qu'`Exercice_3`. À pratiquer après
`Creer_des_fonctions_1`/`_2` et `Control_Flow`.

### `Exercice_5` — représentations graphiques

Nuage de points, boîte à moustaches, diagramme en bâtons, couleur selon un
groupe, avec `ggplot2` sur `hdv2003`. À pratiquer après
`Representations_graphiques`.

---

## Comment choisir

- Vous voulez écrire vos propres fonctions plutôt que d'utiliser seulement
  celles de R ? → `Creer_des_fonctions_1`, puis `_2`, puis `Exercice_3`.
- Vous êtes à l'aise avec les fonctions et voulez des compléments
  (appairage, fonctions en argument, lambdas) ? → `Scripts_et_fonctions`.
- Vous voulez automatiser des tâches répétitives ? → `Control_Flow`, puis
  `Exercice_4` pour combiner avec les fonctions.
- Vous travaillez avec des fichiers externes à R ? →
  `Fichiers_et_espace_de_travail`.
- Les probabilités et la simulation vous intéressent ? → `Tirages_aleatoires`
  (après `Vecteurs_numériques` si vous voulez d'abord voir `seq()`/`rep()`).
- Vous voulez simplement pratiquer ce qui a déjà été vu en cours, sans
  nouveau contenu ? → `Exercice_1` à `Exercice_5`, selon la séance.
