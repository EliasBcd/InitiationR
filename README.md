# Initiation à R

Ce cours est le compagnon interactif du cours d'introduction à R donné en L3 d'économie gestion, parcours économie-finance à l'[université Paris 8](https://www.univ-paris8.fr).  
Les étudiants qui suivent le cours ont en plus accès à un [espace de cours](https://moodle.univ-paris8.fr/course/view.php?id=18115) sur le Moodle de l'université.

## Installation du cours

Il faut d'abord avoir installer le paquet `swirl`, développé par l'équipe de [swirlstats](https://swirlstats.com/).
Pour les débutants dans `R`, la méthode pour ce faire est disponible [ici](https://swirlstats.com/students.html) (en anglais).

Une fois `swirl` installé, pour utiliser ce cours, on peut utiliser la méthode intégrée au paquet, en tapant les commandes suivantes dans la console `R`.

```r
library(swirl)
install_course_github("EliasBcd", "InitiationR")
swirl()
```

### Installation manuelle

Il est aussi possible de l'installer manuellement.

1. Télécharger ce [fichier](https://github.com/EliasBcd/InitiationR/raw/master/InitiationR.swc).
2. Lancer `swirl::install_course()` dans la console R.
3. Sélectionner le fichier que vous avez téléchargé.

## Aide

Si vous avez des questions sur swirl, allez sur <http://swirlstats.com/>, et ouvrez une *issue* ou écrivez un courriel à [info@swirlstats.com](mailto:info@swirlstats.com).
Si vous avez des questions sur ce cours en particulier, vous pouvez m'écrire à [elias.bouacida@univ-paris8.fr](mailto:elias.bouacida@univ-paris8.fr).