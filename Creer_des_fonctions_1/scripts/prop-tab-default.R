#  On reprend la fonction prop_tab avec l'argument decimales défini auparavant.
# La différence est maintenant qu'on a ajouté une valeur par défaut à l'argument decimales.
# Il n'y a alors plus besoin de donner une valeur à l'argument decimales au moment d'appeler la fonction.
# S'il n'y a pas de valeur donné, R utilisera la valeur par défaut.

prop_tab <- function(v, decimales = 1) {
  tri <- table(v)
  effectif_total <- length(v)
  tri <- round(tri / effectif_total * 100, decimales)
  return(tri)
}

# Tapez submit() une fois que vous avez fini de lire le script.