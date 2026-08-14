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
| 1 | `Manipulations_simples`, `Types`, `Vecteurs`, `Fonctions`, `Messages_erreurs`, `Logique` | `Logique` déplacée dans le parcours obligatoire (§2.1) |
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

La leçon swirl dédiée à la lecture des messages d'erreur, évoquée plus haut
comme fil conducteur à préserver (`CLAUDE.md` du dépôt `rl3`), a été créée :
`Messages_erreurs`, placée dans le `MANIFEST` juste après `Fonctions` et avant
`Logique` (voir le tableau ci-dessus et §3.6).

---

## 3. Travaux

### 3.1 `Manipuler_les_donnees` (séance 2) — fait, 33 éléments

Prérequis : `Vecteurs`, `Fonctions`.

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
16. Vérification : `d$minutes.tv` existe bien après l'assignation

Le point 14 est l'objectif pédagogique principal de la leçon. Ne pas
l'escamoter : c'est l'erreur silencieuse la plus fréquente des débutants avec
dplyr, et swirl est le seul endroit où on peut la leur faire commettre dans un
cadre contrôlé.

### 3.2 `Decrire_les_donnees` (séance 3) — fait, 40 éléments

Créée puis complétée pour couvrir intégralement `03Analyse.qmd`. Prérequis :
`Manipuler_les_donnees`, `Valeurs_manquantes` (déplacée avant elle dans le
`MANIFEST`, voir §3.6).

Programme réel :

1. Reconstitution de `d` (`data(hdv2003)`, `as_tibble`)
2. `d |> summarise(moyenne = mean(age))`
3. `summarise()` avec plusieurs indicateurs : moyenne, minimum, maximum
4. Dispersion : étendue, `var()`, `sd()`
5. Quartiles : `quantile(age, c(0.25, 0.50, 0.75))` dans un seul `summarise()`
6. `summary(d$age)` — aperçu rapide, limites face à `summarise()`
7. `d |> summarise(moyenne = mean(heures.tv))` → renvoie `NA`
8. **Question à choix multiple** : pourquoi ? (renvoie au piège NA vu dans
   `Valeurs_manquantes`)
9. `mean(heures.tv, na.rm = TRUE)`
10. `sum(is.na(d$heures.tv))` — compter ce qu'on écarte
11. `d |> count(sexe)`
12. `d |> count(qualif, sort = TRUE)` — observer la ligne `NA`
13. `count()` suivi de `mutate(pourcentage = 100 * n / sum(n))`
14. `d |> group_by(sexe) |> summarise(effectif = n(), age_moyen = mean(age))`
15. Même chose groupée par `qualif`, avec `arrange(desc(...))`
16. Groupement croisé `sexe, qualif` avec `.groups = "drop"`
17. **Question à choix multiple** : un des groupes compte moins de dix
    personnes. Peut-on comparer sa moyenne aux autres ?
18. Croisement qualitatif × qualitatif : `count(qualif, sexe)`,
    `pivot_wider(names_from = sexe, values_from = n)`, puis pourcentages en
    ligne via `group_by()` + `mutate()`
19. `cor(age, heures.tv, use = "complete.obs")` — mise en garde
    corrélation ≠ causalité

Les points 8 et 17 restent les objectifs pédagogiques centraux. Le reste
couvre systématiquement `03Analyse.qmd` : indicateurs de dispersion,
`summary()`, croisement de deux variables qualitatives et corrélation, absents
de la version initiale de la leçon.

À signaler, hors périmètre de ce dépôt : `03Analyse.qmd` (fin de fichier)
renvoie encore les étudiants vers la leçon swirl `Analyse_de_données`,
retirée du `MANIFEST` au profit de `Decrire_les_donnees` (§3.5). Référence à
corriger dans le dépôt `rl3`.

### 3.3 `Dataframes` → `Tableaux_de_donnees` — fait

Renommage effectué via `git mv` (le dossier `Dataframes` n'existe plus).
Conversion appliquée :

- `data.frame()` → `tibble()` ;
- `row.names` supprimé : `noms` est une colonne ordinaire ;
- `str()` → `glimpse()` ;
- `d$colonne` conservé pour l'accès direct à une colonne ;
- indexation matricielle (`d[2]`, `d[2, ]`, `d[2, 1]`) ajoutée comme pont
  depuis l'indexation vectorielle, en complément swirl-only sans équivalent
  dans le cours magistral.

Le chargement de `hdv2003` en fin de leçon, initialement prévu ici, a été
retiré : il faisait doublon avec l'ouverture de `Manipuler_les_donnees`, qui
l'a maintenant en exclusivité (`library(questionr)` retiré en conséquence de
`initLesson.R` et `dependson.txt`, devenus inutiles pour cette leçon).

### 3.4 `Representations_graphiques` — fait

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

### 3.5 Retirer `Analyse_de_données` du parcours — fait

Cette leçon couvre déjà `hdv2003`, mais entièrement en R de base : `str()`,
`head(d$age)`, `d$minutes.tv <- d$heures.tv * 60`. Son contenu est repris et
modernisé par `Manipuler_les_donnees` et `Decrire_les_donnees`.

Recommandation : la retirer du `MANIFEST` sans supprimer le dossier, pour ne
pas perdre l'historique. La convertir en tidyverse ferait doublon avec les deux
nouvelles leçons pour un coût de maintenance supérieur.

### 3.6 Mettre à jour le `MANIFEST` — fait

Le `MANIFEST` fixe l'ordre d'affichage. Ordre actuel (`Valeurs_manquantes`
placée avant `Decrire_les_donnees`, comme fondement théorique du comportement
de `NA` ; voir §3.2) :

```
Manipulations_simples
Types
Vecteurs
Fonctions
Messages_erreurs
Logique
Tableaux_de_donnees
Manipuler_les_donnees
Valeurs_manquantes
Decrire_les_donnees
Representations_graphiques
Control_Flow
Creer_des_fonctions_1
Creer_des_fonctions_2
Scripts_et_fonctions
Exercice_1
Exercice_2
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

`expr_uses_func('verbe')` a été utilisé largement dans les premières versions
de `Manipuler_les_donnees`, `Decrire_les_donnees` et `Tableaux_de_donnees`,
mais s'est révélé **trop permissif** à l'usage : il accepte n'importe quel
appel du verbe nommé, y compris avec de mauvais arguments ou une mauvaise
variable. Il a été retiré de ces trois leçons (plus une occurrence dans
`Tableaux_de_donnees`).

Règle retenue désormais :

- `omnitest(correctExpr = '...')` par défaut, y compris pour les verbes
  dplyr : il exige une correspondance exacte de l'expression, mais accepte
  déjà les deux formes `d |> f()` et `f(d)` du tuyau (§4.1) ;
- quand plusieurs écritures sont également correctes — arguments nommés dont
  l'ordre ne change pas le résultat, comme dans
  `summarise(moyenne = mean(age), minimum = min(age), maximum = max(age))` —
  énumérer les permutations valides avec `any_of_exprs()` plutôt que
  d'assouplir le test avec `expr_uses_func()` ;
- `omnitest(correctVal = ...)` quand seul le résultat importe (typiquement
  les `mult_question`).

`expr_uses_func()` reste disponible, mais n'est plus le choix par défaut : à
n'utiliser que si aucune autre forme raisonnable de la réponse ne peut être
énumérée. Vérifier la liste exacte dans `?AnswerTests` du paquet `swirlify`.

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

### 5.1 Compatibilité de swirl — fait

Le cours a été testé sur la version de R actuelle en cours de session ; il se
lance et s'exécute normalement.

### 5.2 Test de chaque leçon — à faire, par l'enseignant

Avec `swirlify` :

```r
library(swirlify)
set_lesson("chemin/vers/Manipuler_les_donnees/lesson.yaml")
test_lesson()
demo_lesson()
```

`test_lesson()` vérifie que chaque `CorrectAnswer` passe son propre
`AnswerTests`. À lancer sur les leçons converties comme sur les nouvelles.

### 5.3 Parcours complet — à faire, par l'enseignant

Réinstaller le cours depuis GitHub et le suivre en entier dans l'ordre du
`MANIFEST`, dans une session R vierge, comme le ferait un étudiant :

```r
uninstall_course("InitiationR")
install_course_github("EliasBcd", "InitiationR")
```

Vérifier au passage qu'un fichier `.txt` est bien produit à la fin de chaque
leçon du parcours obligatoire.

---

## 6. État des lieux

Tout le contenu prévu en §3 a été livré : les six leçons obligatoires
existantes (`Manipulations_simples`, `Types`, `Vecteurs`, `Fonctions`,
`Logique`) ont en plus été revues une par une (cohérence avec le cours,
redites entre leçons, hints reformulés pour ne plus donner la commande
directement), et une leçon supplémentaire, `Messages_erreurs`, a été créée
pour couvrir la lecture des messages d'erreur (§2.1).

Travaux réalisés au-delà du périmètre initial de ce document :

- Revue complète des onze leçons du parcours obligatoire (cohérence avec le
  cours magistral, redites entre leçons, reformulation des hints) ;
- Resserrement des `AnswerTests` trop permissifs (§4.2) dans
  `Manipuler_les_donnees`, `Decrire_les_donnees`, `Tableaux_de_donnees` et
  `Representations_graphiques` ;
- Uniformisation de `pre_fill_link` et `saved` dans tous les
  `customTests.R` du dépôt ;
- Réordonnancement de `Valeurs_manquantes` avant `Decrire_les_donnees` dans
  le `MANIFEST`, comme fondement théorique du comportement de `NA` (§3.2,
  §3.6) ;
- Revue complète des leçons hors parcours obligatoire et des exercices de
  synthèse (§7).

Restent à la charge de l'enseignant : §5.2 et §5.3 (tests R effectifs,
l'enseignant ayant indiqué préférer les exécuter lui-même), ainsi que la
correction de la référence obsolète à `Analyse_de_données` dans
`03Analyse.qmd` du dépôt `rl3` (§3.2).

## 7. Leçons optionnelles et exercices de synthèse

Revue complète des sept leçons hors parcours obligatoire (`Control_Flow`,
`Creer_des_fonctions_1`, `Creer_des_fonctions_2`, `Scripts_et_fonctions`,
`Fichiers_et_espace_de_travail`, `Vecteurs_numériques`, `Tirages_aleatoires`)
et des cinq exercices de synthèse (`Exercice_1` à `Exercice_5`). Résumé
destiné aux étudiants dans
[`LECONS_OPTIONNELLES.md`](LECONS_OPTIONNELLES.md), lié depuis le `README`.

### 7.1 Aucun recoupement avec le parcours obligatoire

`Fonctions` (obligatoire) ne couvre que l'usage de fonctions existantes,
jamais leur création (`function(...)`). Les leçons optionnelles occupent un
terrain entièrement distinct : pas de doublon à corriger de ce côté.

### 7.2 Doublon retiré : `Scripts_et_fonctions` vs `Creer_des_fonctions_2`

Trois points de recoupement identifiés entre les trois leçons sur la
création de fonctions : le détour par les listes nommées, l'exercice
`manif.R` sur l'argument `...` (fichier identique dans les deux leçons), et
arguments par défaut/position/nom (même idée, exemples différents, pas de
duplication littérale — conservé).

Retiré de `Scripts_et_fonctions` : le détour listes nommées et l'exercice
`manif.R` (avec son test `test_func6()` dans `customTests.R` et les scripts
`manif.R`/`manif-correct.R`, supprimés). La leçon renvoie maintenant vers
`Creer_des_fonctions_2` pour ce contenu, et garde son contenu propre
(fonction en argument d'une autre fonction, lambdas, `args()`, `paste()`,
appairage partiel).

### 7.3 `AnswerTests` des leçons optionnelles — pas de resserrement nécessaire

Contrairement au parcours obligatoire (§4.2), les leçons optionnelles
n'avaient pas le même défaut de permissivité systématique :

- `match_call(...)` (`Tirages_aleatoires`) normalise l'appel avant
  comparaison (arguments nommés vs positionnels équivalents) — plus robuste
  que `omnitest(correctExpr = ...)` pour des tirages aléatoires où l'ordre
  des arguments varie légitimement, pas un problème à corriger ;
- `expr_uses_func('prop_tab')` / `expr_uses_func('telegram')`
  (`Creer_des_fonctions_1`, `Scripts_et_fonctions`) : permissivité
  volontaire, cohérente avec des consignes qui laissent explicitement
  l'étudiant choisir ses arguments ("par exemple la variable qualif",
  "n'importe quels arguments") — pas à resserrer.

### 7.4 Exercices convertis vers le cours actuel

`Exercice_2` et `Exercice_5` utilisaient encore l'ancienne version du cours
(R de base sur `hdv2003` via `df$`/`table()`/`summary()` pour le premier,
`rp2018` au lieu de `hdv2003` pour le second) — contradiction avec le cours
actuel, sur le même modèle que `Dataframes`/`Representations_graphiques`
avant leur conversion (§1).

- `Exercice_2` : script et questions convertis en tidyverse
  (`as_tibble()`, `glimpse()`, `summarise()`, `count()`) ; `initLesson.R` et
  `dependson.txt` mis à jour pour charger `tidyverse` ; `test_exo1()` dans
  `customTests.R` corrigé pour vérifier l'objet `d` plutôt que `df`/`nom`.
- `Exercice_5` : `rp2018`/`rp69` remplacés par `hdv2003`/`d`, avec les
  variables déjà utilisées dans `Representations_graphiques` (`age`,
  `heures.tv`, `sexe`, `qualif`), permutations d'arguments tolérées comme
  dans les autres leçons `ggplot2` (§4.2).

`Exercice_1`, `_3` et `_4` étaient déjà alignés sur le cours actuel, aucune
conversion nécessaire.

## 8. Notes de syntaxe

### 8.1 Deux-points dans un champ de texte

Un champ `Output` ou `Hint` non entouré de guillemets est interprété comme un
scalaire YAML : un `:` suivi d'un espace y est lu comme un séparateur clé/valeur
et casse le parsing (erreur `mapping values are not allowed here`).

Dès qu'une phrase contient un `:` suivi d'un espace (énumération, citation d'un
message R du type `Erreur : objet introuvable`), entourer tout le champ de
guillemets simples `'...'`, et doubler les apostrophes internes (`'` devient
`''`) :

```yaml
Output: 'Le message affiché est : "objet introuvable".'
```

Reformuler pour éviter le `:` (par une virgule ou un point-virgule) reste une
alternative plus simple quand la citation exacte n'est pas nécessaire.