# Nous allons maintenant réécrire la fonction précédente à l'aide de while() 
# plutôt que break()
# 
# On suppose que tout les éléments d'un vecteur numérique sont ordonnés du plus petit au plus grand.
# On veut sélectionner seulement les éléments inférieurs ou égaux à 20 en utilisant while
# Avec while(), nous allons parcourir tous les éléments du vecteur x.
# Nous commencerons donc par initialiser un index i à 1 (le premier élément)

while_function <- function(x){
  res <- c()
  i <- 1 # Initiation de l'indexation
  while(x[i] <= 20){
    res <- c(res, x[i]) # Ce code sert à ajouter un élément à un vecteur déjà existant.
    i <- i + 1 # Incrémentation de l'indexation
  }
  res
}