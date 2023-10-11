# Écrire dans ce script une fonction nommée alea qui accepte un argument n, génère un vecteur 
# de n valeurs aléatoires entre 0 et 1 avec la fonction runif(n) et retourne ce 
# vecteur comme résultat.
# Tapez submit une fois que vous avez écrit la fonction.

alea <- function(n) {
  v <- runif(n)
  return(v)
}
