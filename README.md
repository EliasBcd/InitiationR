# Initiation à R

Ce cours est le compagnon interactif du cours d'introduction à R donné en L3 d'économie gestion, parcours économie-finance à l'[université Paris 8](https://www.univ-paris8.fr).  
Les étudiants qui suivent le cours ont en plus accès à un [espace de cours](https://moodle.univ-paris8.fr/course/view.php?id=18115) sur le Moodle de l'université.

Le parcours obligatoire couvre R et le tidyverse, à partir d'un unique jeu de
données (`hdv2003`, l'enquête *Histoire de vie* 2003 de l'INSEE) : manipuler
des vecteurs et des tableaux, décrire des données, lire les messages
d'erreur et produire des représentations graphiques.

## Installation du cours

Il faut d'abord avoir installé le paquet `swirl`, développé par l'équipe de [swirlstats](https://swirlstats.com/).
Pour les débutants dans `R`, la méthode pour ce faire est disponible [ici](https://swirlstats.com/students.html) (en anglais).

Une fois `swirl` installé, pour utiliser ce cours, on peut utiliser la méthode intégrée au paquet, en tapant les commandes suivantes dans la console `R`.

```r
library(swirl)
install_course_github("EliasBcd", "InitiationR")
swirl()
```

## Leçons optionnelles

En plus du parcours obligatoire suivi en cours, ce cours propose des leçons
en autonomie pour aller plus loin. Voir [LECONS_OPTIONNELLES.md](LECONS_OPTIONNELLES.md)
pour un résumé de ce que chacune contient.

## Aide

Si vous avez des questions sur swirl, allez sur <http://swirlstats.com/>, et ouvrez une *issue* ou écrivez un courriel à [info@swirlstats.com](mailto:info@swirlstats.com).
Si vous avez des questions sur ce cours en particulier, vous pouvez m'écrire à [elias.bouacida@univ-paris8.fr](mailto:elias.bouacida@univ-paris8.fr).