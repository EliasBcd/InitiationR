# Voici une fonction très simple, et peu utile.
# Elle ajoute 2 à la valeur saisie en entrée.
#
# Si on décompose la fonction, on a :
# - Une fonction est créée en utilisant l'instruction `function`. Celle-ci est suivie d'une paire de parenthèses et d'une paire d'accolades.
# - Dans les parenthèses, on indique les *arguments* de la fonction, ceux qui devront lui être passés quand nous l'appellerons.
# Ici notre fonction ne prend qu'un seul argument, que nous avons décidé arbitrairement de nommer `x`.
# - Les accolades comprennent une série d'instructions R qui constituent le *corps* de notre fonction. 
# C'est ce code qui sera exécuté quand notre fonction est appelée.
# On peut utiliser dans le corps de la fonction les arguments qui lui sont passés. 
# Ici, la première ligne utilise la valeur de l'argument `x`, lui ajoute 2 et stocke le résultat dans un nouvel objet `res`.
# - Pour qu'elle soit utile, notre fonction doit renvoyer le résultat qu'elle a calculé précédemment. 
# Ceci se fait via l'instruction `return` à qui on passe la valeur à retourner.
# - Enfin, pour que notre fonction puisse être appelée et utilisée, nous devons lui donner un nom, ou plus précisément la stocker dans un objet. 
# Ici on la stocke dans un objet nommé `ajoute2`.



ajoute2 <- function(x) {
  res <- x + 2
  return(res)
}