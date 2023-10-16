# Prenons un exemple un peu plus élaboré : la fonction `table()` retourne le tri à plat en effectifs d'une variable qualitative.
# On souhaite créer une fonction qui calcule plutôt le tri à plat en pourcentages. 
# Voici une manière de le faire.

# Notre fonction prend en entrée un argument nommé `v`, en l'occurrence un vecteur représentant une variable qualitative. 
# On commence par faire le tri à plat de ce vecteur avec `table`, 
# puis on calcule la répartition en pourcentages en divisant ce tri à plat par l'effectif total et en multipliant par 100.

prop_tab <- function(v) {
  tri <- table(v)
  effectif_total <- length(v)
  tri <- round(tri / effectif_total * 100, 1) # On modifie cette ligne là en ajoutant la fonction round, qui arrondi le résultat. Ici à la première décimale.
  return(tri)
}

# Tapez submit() une fois que vous avez fini de lire le script.