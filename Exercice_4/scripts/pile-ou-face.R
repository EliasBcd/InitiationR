# Soit la fonction pile_ou_face suivante, qui simule un jet de pièce :
#   
#   pile_ou_face <- function() {
#     alea <- runif(1)
#     if (alea < 0.5) {
#       result <- "pile"
#     } else {
#       result <- "face"
#     }
#     result
#   }
#   
# Modifiez cette fonction en utilisant une boucle for ou while pour qu'elle accepte un
# argument n et retourne un vecteur comprenant le résultat de n tirages.
# Conseils : la fonction seq_len(n) permet d'obtenir une séquence de nombre entier 
# croissant de 1 à n.
# 
# Tapez submit() dans la console après avoir enregistré le script une fois que vous avez fini

pile_ou_face <- function(n) {
  tirages <- character()
  for (i in seq_len(n)) {
    alea <- runif(1)
    if (alea < 0.5) {
      tirages <- c(tirages, "pile")
    } else {
      tirages <- c(tirages, "face")
    }
  }
  tirages
}