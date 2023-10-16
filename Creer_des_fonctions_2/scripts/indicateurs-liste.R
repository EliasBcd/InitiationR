# Voici la fonction indicateurs, qui calcule d'abord la moyenne puis l'écart type d'un vecteur.
# Plutôt que de se contenter de les afficher dans la console, on pourrait vouloir retourner ces deux valeurs pour pouvoir les réutiliser par la suite.
# Pour cela, une première solution pourrait être de renvoyer un vecteur comportant ces deux valeurs.
# Mais dans ce cas de figure il est recommandé de retourner plutôt une liste nommée.

indicateurs <- function(v) {
  moyenne <- mean(v)
  ecart_type <- sd(v)
  list(moyenne = moyenne, ecart_type = ecart_type) # Liste nommée renvoyant la moyenne et l'écart type.
}

# Tapez submit() une fois que vous avez bien observé la fonction.