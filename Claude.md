---
lang: fr
---

# Spécifications — mise à jour du cours swirl `InitiationR`

Dépôt : `EliasBcd/InitiationR`. Cours swirl « Initiation à R », 21 leçons en
français, dernière modification octobre 2024.

Objet : aligner le cours swirl sur la refonte 2026 du cours M3P (cinq séances,
tidyverse, jeu de données unique `hdv2003`, priorité à l'analyse et à la
représentation de données).

---

## 1. Constat

Le cours swirl a été écrit pour une progression en R de base. La refonte du
cours magistral passe au tidyverse dès la séance 2. **Il manque aujourd'hui
toute couverture swirl des séances 2 et 3**, qui sont pourtant le cœur du
nouveau cours : aucune leçon ne traite `select`, `filter`, `arrange`, `mutate`,
`summarise`, `count` ni `group_by`.

Par ailleurs, deux leçons entrent en contradiction avec le cours :

- `Dataframes` construit un tableau avec `data.frame(..., row.names = noms)`,
  forme que le cours n'utilise plus et que les tibbles ne supportent pas.
- `Representations_graphiques` travaille sur `rp2018`, alors que le cours a été
  unifié sur `hdv2003`.

---

## 2. Parcours cible

| Séance | Leçons swirl | État |
|---|---|---|
| 1 | `Manipulations_simples`, `Types`, `Vecteurs`, `Fonctions`, `Logique` | `Logique` déplacée dans le parcours obligatoire (§2.1) |
| 2 | `Tableaux_de_donnees`, `Manipuler_les_donnees` | converties / créées |
| 3 | `Valeurs_manquantes`, `Decrire_les_donnees` | inchangée / créée |
| 4 | `Representations_graphiques` | convertie |
| 5 | — | projet, pas de swirl |

Hors parcours obligatoire, maintenues et proposées en autonomie :
`Control_Flow`, `Creer_des_fonctions_1`, `Creer_des_fonctions_2`,
`Scripts_et_fonctions`, `Fichiers_et_espace_de_travail`, `Tirages_aleatoires`,
`Vecteurs_numériques`, `Exercice_1` à `Exercice_5`.

### 2.1 `Logique` reclassée dans le parcours obligatoire (séance 1)

Le cours magistral 2026-2027 (`01PremiersPas.qmd`) introduit les opérateurs de
comparaison (`==`, `!=`, `<`, `>`, `<=`, `>=`) et logiques (`!`, `&`, `|`) dès
la séance 1, avec l'avertissement `==` vs `=` et un teaser explicite vers
`filter(age < 25)` de la séance 2. `Manipuler_les_donnees` (§3.1) utilise `==`
et `filter()` sans réexpliquer ces opérateurs.

La leçon swirl `Logique` couvrait déjà tout ce contenu, mais était classée
« hors parcours, en autonomie ». Elle a été déplacée dans le `MANIFEST`, après
`Fonctions` et avant `Exercice_1`, pour devenir un prérequis explicite des
séances 2 et 3. Son contenu n'a pas été modifié.

Reste à traiter séparément (hors périmètre de ce document) : la séance 1 ne
couvre pas la lecture des messages d'erreur, alors que le `CLAUDE.md` du dépôt
`rl3` la désigne comme un fil conducteur à préserver. Une leçon swirl dédiée
est prévue.

---

## 3. Travaux

### 3.1 Créer `Manipuler_les_donnees` (séance 2)

Nouvelle leçon. Environ 30 éléments. Prérequis : `Vecteurs`, `Fonctions`.

`initLesson.R` charge silencieusement `tidyverse` et `questionr`. L'étudiant
tape lui-même le chargement des données.

Progression :

1. `data(hdv2003)` puis `d <- as_tibble(hdv2003)`
2. `d` — observer l'affichage tronqué à dix lignes, et les types de colonnes
3. `glimpse(d)`
4. `nrow(d)`, `ncol(d)`, `names(d)`
5. Question à choix multiple : combien de variables quantitatives ?
6. `levels(d$qualif)` — introduire la notion de facteur
7. `d |> select(age, sexe, heures.tv)`
8. `d |> select(-id)`
9. `d |> filter(age < 25)`
10. `d |> filter(age < 25, sexe == "Femme")` — insister sur `==`
11. `d |> arrange(age)` puis `arrange(desc(age))`
12. Enchaînement de trois verbes
13. `d |> mutate(minutes.tv = heures.tv * 60)`
14. **Question à choix multiple** : après cette commande, la variable
    `minutes.tv` existe-t-elle dans `d` ? Réponse : non.
15. `d <- d |> mutate(minutes.tv = heures.tv * 60)`

Le point 14 est l'objectif pédagogique principal de la leçon. Ne pas
l'escamoter : c'est l'erreur silencieuse la plus fréquente des débutants avec
dplyr, et swirl est le seul endroit où on peut la leur faire commettre dans un
cadre contrôlé.

### 3.2 Créer `Decrire_les_donnees` (séance 3)

Nouvelle leçon. Environ 30 éléments. Prérequis : `Manipuler_les_donnees`.

1. Reconstitution de `d` (`data(hdv2003)`, `as_tibble`)
2. `d |> summarise(moyenne = mean(age))`
3. `summarise()` avec plusieurs indicateurs : moyenne, médiane, écart-type
4. `quantile(age, 0.25)` dans un `summarise()`
5. `d |> summarise(moyenne = mean(heures.tv))` → renvoie `NA`
6. **Question à choix multiple** : pourquoi ?
7. `mean(heures.tv, na.rm = TRUE)`
8. `sum(is.na(d$heures.tv))` — compter ce qu'on écarte
9. `d |> count(sexe)`
10. `d |> count(qualif, sort = TRUE)` — observer la ligne `NA`
11. `count()` suivi de `mutate(pourcentage = 100 * n / sum(n))`
12. `d |> group_by(sexe) |> summarise(effectif = n(), age_moyen = mean(age))`
13. Même chose groupée par `qualif`, avec `arrange(desc(...))`
14. **Question à choix multiple** : un des groupes compte moins de dix
    personnes. Peut-on comparer sa moyenne aux autres ?

Les points 6 et 14 sont les objectifs de la leçon. Le reste est de la mécanique.

### 3.3 Convertir `Dataframes` → `Tableaux_de_donnees`

La leçon actuelle fait construire un `data.frame` à partir de trois vecteurs
saisis à la main (`tailles`, `poids`, `noms`), avec `row.names = noms`.

Conserver la démarche — construire un tableau à partir de vecteurs connus est
une bonne entrée en matière — mais :

- remplacer `data.frame()` par `tibble()` ;
- **supprimer `row.names`** : les tibbles ne gèrent pas les noms de lignes.
  Faire de `noms` une colonne ordinaire ;
- remplacer `str()` par `glimpse()` ;
- conserver `d$colonne`, en précisant que c'est l'accès direct à une colonne ;
- terminer en chargeant `hdv2003` pour montrer un tableau réel après le tableau
  jouet.

Renommer le dossier et l'entrée `Lesson:` du bloc `meta`.

### 3.4 Convertir `Representations_graphiques`

Passer de `rp2018` à `hdv2003`. Correspondances :

| Actuel | Cible |
|---|---|
| `data(rp2018)`, objet `rp` | `data(hdv2003)`, `d <- as_tibble(hdv2003)` |
| `geom_histogram(aes(cadres))` | `geom_histogram(aes(x = age))` |
| `geom_histogram(aes(ouvr))` | `geom_histogram(aes(x = heures.tv))` |
| `geom_point(aes(dipl_sup, cadres))` | `geom_jitter(aes(x = age, y = heures.tv), alpha = 0.15)` |
| `xlab('diplomés du supérieur')` | `labs(x = "Âge", y = "Heures de télévision")` |
| `color = departement` | `color = sexe` |

Ajouter en fin de leçon, absents de la version actuelle mais présents dans le
cours :

- `geom_bar(aes(y = qualif))` pour une variable qualitative
- `geom_boxplot(aes(x = sexe, y = heures.tv))`
- `facet_wrap(~ sexe)`
- **Question à choix multiple** sur `color = "red"` placé dans `aes()` ou en
  dehors

Remplacer `xlab()`/`ylab()` par `labs()` partout, pour rester cohérent avec le
cours.

### 3.5 Retirer `Analyse_de_données` du parcours

Cette leçon couvre déjà `hdv2003`, mais entièrement en R de base : `str()`,
`head(d$age)`, `d$minutes.tv <- d$heures.tv * 60`. Son contenu est repris et
modernisé par `Manipuler_les_donnees` et `Decrire_les_donnees`.

Recommandation : la retirer du `MANIFEST` sans supprimer le dossier, pour ne
pas perdre l'historique. La convertir en tidyverse ferait doublon avec les deux
nouvelles leçons pour un coût de maintenance supérieur.

### 3.6 Mettre à jour le `MANIFEST`

Le `MANIFEST` fixe l'ordre d'affichage. Ordre cible :

```
Manipulations_simples
Types
Vecteurs
Fonctions
Exercice_1
Tableaux_de_donnees
Manipuler_les_donnees
Valeurs_manquantes
Decrire_les_donnees
Exercice_2
Representations_graphiques
Logique
Control_Flow
Creer_des_fonctions_1
Creer_des_fonctions_2
Scripts_et_fonctions
Exercice_3
Exercice_4
Fichiers_et_espace_de_travail
Vecteurs_numériques
Tirages_aleatoires
```

Les leçons du parcours obligatoire d'abord, dans l'ordre des séances, puis
celles laissées en autonomie. `Exercice_5` porte sur `rp2018` : le retirer ou
le convertir, selon le temps disponible.

---

## 4. Contraintes techniques

### 4.1 Le tuyau natif n'est pas testable

`|>` est une transformation effectuée par l'analyseur syntaxique de R :
`d |> filter(age < 25)` est converti en `filter(d, age < 25)` **avant** toute
évaluation. Conséquence pour swirl :

- `omnitest(correctExpr = 'd |> filter(age < 25)')` acceptera aussi
  `filter(d, age < 25)`, et inversement ;
- il est **impossible** de contraindre l'étudiant à employer le tuyau.

Ne pas chercher à contourner. Écrire les `CorrectAnswer` avec `|>`, laisser
passer les deux formes, et porter la consigne dans les champs `Output` et
`Hint`.

### 4.2 Choisir les bons tests de réponse

`omnitest()` exige une correspondance exacte de l'expression. C'est acceptable
pour `2 + 2`, mais inadapté aux verbes dplyr, où plusieurs écritures sont
également correctes (ordre des arguments, guillemets simples ou doubles,
espaces).

Préférer, pour les nouvelles leçons :

- `expr_uses_func()` quand ce qui compte est le verbe employé ;
- `any_of_exprs()` pour énumérer les formes acceptables ;
- `omnitest(correctVal = ...)` quand seul le résultat importe.

Vérifier la liste exacte dans `?AnswerTests` du paquet `swirlify`.

### 4.3 Chargement des extensions

`Analyse_de_données` fait taper `install.packages("questionr")` **pendant** la
leçon. En salle machine, c'est fragile : installation longue, choix de miroir,
droits d'écriture.

Pour les nouvelles leçons :

- déclarer `tidyverse` et `questionr` dans `dependson.txt` ;
- charger les extensions dans `initLesson.R`, pas dans le corps de la leçon ;
- faire taper à l'étudiant `data(hdv2003)` et `as_tibble()`, qui sont
  instantanés.

### 4.4 Affichage des tableaux

`hdv2003` compte 2000 lignes. Toute leçon qui fait afficher le tableau doit
passer par `as_tibble()` au préalable, sinon la console est noyée et la leçon
devient impraticable.

### 4.5 Journalisation

Chaque nouvelle leçon doit contenir dans son `initLesson.R` :

```r
swirl_options(swirl_logging = TRUE)
```

C'est ce qui produit le fichier `.txt` déposé par les étudiants sur Moodle, et
donc tout le suivi de progression. Une leçon créée sans cette ligne est
invisible dans l'évaluation.

### 4.6 Bloc `meta`

Reprendre à l'identique le bloc des leçons existantes : `Course: Initiation à
R`, `Author: Elias Bouacida`, `Organization: Université Paris 8`,
`Type: Standard`. Le champ `Version` indique la version de swirl visée — le
vérifier après le test de compatibilité (§5.1).

---

## 5. Vérifications avant mise en service

### 5.1 Compatibilité de swirl

Le cours n'a pas été testé depuis octobre 2024. Avant tout développement,
installer swirl sur la version de R des salles machine et faire tourner une
leçon existante de bout en bout. `swirl` est sensible aux montées de version de
R, et un cours qui ne se lance pas rend le dispositif entier inutilisable.

### 5.2 Test de chaque leçon

Avec `swirlify` :

```r
library(swirlify)
set_lesson("chemin/vers/Manipuler_les_donnees/lesson.yaml")
test_lesson()
demo_lesson()
```

`test_lesson()` vérifie que chaque `CorrectAnswer` passe son propre
`AnswerTests`. À lancer sur les leçons converties comme sur les nouvelles.

### 5.3 Parcours complet

Réinstaller le cours depuis GitHub et le suivre en entier dans l'ordre du
`MANIFEST`, dans une session R vierge, comme le ferait un étudiant :

```r
uninstall_course("InitiationR")
install_course_github("EliasBcd", "InitiationR")
```

Vérifier au passage qu'un fichier `.txt` est bien produit à la fin de chaque
leçon du parcours obligatoire.

---

## 6. Ordre de travail suggéré

1. Test de compatibilité swirl (§5.1) — bloquant, à faire en premier
2. `Manipuler_les_donnees` (§3.1)
3. `Decrire_les_donnees` (§3.2)
4. `Representations_graphiques` (§3.4)
5. `Tableaux_de_donnees` (§3.3)
6. `MANIFEST` et retrait d'`Analyse_de_données` (§3.5, §3.6)
7. Parcours complet (§5.3)

Les points 2 et 3 comblent le manque réel ; le reste est de la mise en
cohérence. Si le temps manque, les livrer seuls et laisser
`Representations_graphiques` sur `rp2018` pour cette année, en signalant en
séance 4 que la leçon swirl utilise un autre jeu de données.

## 7. Notes de syntaxe

Quand il y a besoin d'utiliser : dans un texte swirl, il est nécessaire de mettre des guillemets autour.