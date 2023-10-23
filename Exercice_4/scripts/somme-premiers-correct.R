# À l'aide d'une boucle for, écrire une fonction somme_premiers_positifs qui prend en 
# argument un vecteur x et retourne la somme de tous les nombres positifs qu'il contient
# en partant du début du vecteur et en s'arrêtant au premier élément négatif.
#
# Tapez submit() dans la console après avoir enregistré le script une fois que vous avez fini

somme_premiers_positifs <- function(x) {
  somme <- 0
  for (item in x) {
    if (item < 0) {
      break
    }
    somme <- somme + item
  }
  somme
}