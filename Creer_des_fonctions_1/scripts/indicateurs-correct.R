# Voici la fonction indicateurs, qui calcule d'abord la moyenne puis l'écart type d'un vecteur.
# Elle les affiche ensuite dans la console à l'aide de la fonction print().
# print() est une fonction très utile quand on écrit un script.
# Elle permet d'afficher dans la console des résultats sans interrompre son fonctionnement.
# Cela peut servir à débugger les fonction que l'on code, ou bien à indiquer à quel stade se trouve-t-on dans le script.
# Tapez submit() une fois que vous avez fini de lire ce code.

indicateurs <- function(v) {
  print(mean(v))
  print(sd(v))
}