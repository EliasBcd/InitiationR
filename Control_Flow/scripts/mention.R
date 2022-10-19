# Si nous voulons créer une fonction temps qui prend le temps mis pour faire un 100m
# pour un homme et qui nous renvoie à quel point le temps est bon ou pas, nous 
# procédons de la sorte :
# 
# temps <- function(x) {
#   if (x<9.69) {
#     "Record du monde"
#   }
#   else if (x < 10) {
#     "Champion du monde"
#   }
#   else if (x <11) {
#     "Très rapide"
#   }
#   else {
#     "Personne normale"
#   }
# }
# 
# Analysons un peut ce code. 
# L'évaluation conditionnelle commence par if. 
# Les condition else if capturent progressivement les autres temps. 
# Si x n'est pas plus petit que 9.69, alors on teste si x est plus petit que 10, etc.
# La dernière condition est else (qui n'est pas obligatoire). 
# Elle capture tous les temps qui n'ont pas été capturés auparavant.
# 
# Imaginons que vous voulez maintenant créé une fonction mention qui donne automatiquement
# la mention correspondant à une moyenne.
# On considère ici que 16 ou plus donne Très bien.
# Entre 14 (inclus) et 16 (exclus) donne Bien.
# Entre 12 (inclus) et 14 (exclus) donne  Assez bien.
# Et les autres notes ne donnent pas le droit à une mention.


mention <- function(x) {
  if (# Code à remplir) {
    "Très bien"
  
    ## Ajouter ici votre code
  } else {
    ""
  }
}
