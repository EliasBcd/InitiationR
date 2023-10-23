# Créer une fonction proportion qui prend en argument un vecteur x et retourne les valeurs de ce vecteur divisée par leur somme.
# Faites en sorte qu'elle renvoie un message d'erreur à l'aide de la fonction stop() si la somme des valeurs est nulle.
# 
# Tapez submit() dans la console après avoir enregistré le script une fois que vous avez fini

proportion <- function(x) {
  if (sum(x) == 0) {
    stop("la somme des éléments de x vaut zéro")
  }
  x / sum(x)
}