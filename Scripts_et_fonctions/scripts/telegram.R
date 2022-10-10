# Les ... peuvent être utilisé pour passer un argument d'une première fonction
# dans une deuxième fonction. En général, les ... sont les derniers arguments 
# d'une fonction. Une fonction avec un tel argument ressemble en général à ceci :
#
# ellipses_func(arg1, arg2 = TRUE, ...)
#
# Dans la fonction précédente, arg1 n'a pas de valeur par défaut, il faut donc 
# systématiquement donner une valeur à arg1. arg2 a une valeur par défaut et 
# d'autres arguments peuvent être donné après arg2, en fonction de comment est
# définie la fonction ellipses_func(). Si on regarde comment la fonction paste()
# est définie, on observe ceci :
#
# paste (..., sep = " ", collapse = NULL)
#
# Les ... sont le premier argument ! Et tous les arguments après les ... ont une
# valeur par défaut. C'est une règle stricte de programmation dans R. Tous les 
# arguments après  les ... doivent avoir une valeur par défaut. Regardons par 
# exemple la fonction jacadi suivante :
#
# jacadi <- function(...){
#   paste("Jacques a dit :", ...)
# }
#
# La fonction jacadi est semblable à la fonction paste. La seule différence est 
# qu'elle ajoute au début de chaque chaîne de caractère "Jacques a dit :"
#
# Les télégrammes étaient auparavant entourés des mots START et STOP au début
# et à la fin de chaque phrase. Ecrivez une fonction appelée telegram qui donne
# le format télégramme aux phrases.
# Par exemple, le résultat de la commande `telegram("Bonne", "journée")` devrait
# être :
# "START Bonne journée STOP"

telegram <- function(...){
  
}