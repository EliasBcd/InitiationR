# Écrire une fonction etendue qui prend en entrée un vecteur numérique et 
# retourne la différence entre la valeur maximale et la valeur minimale de ce vecteur.
# Tapez ensuite submit() dans la console pour soumettre votre script, en n'oubliant
# pas de l'enregistrer auparavant.

etendue <- function(v) {
  vmax <- max(v)
  vmin <- min(v)
  return(vmax - vmin)
}
