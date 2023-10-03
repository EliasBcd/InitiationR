# Pour recoder toutes les variables du tableau, on peut être tenté de dupliquer tout le code suivant pour chaque question :
#   df$q1 <- ifelse(df$q1 == "1", "Oui", "Non")
# Nous n'avons pas vu exactement ce que fais la fonction ifelse, mais sachez grossièrement que le premier argument
# doit être un booléen (valoir TRUE ou FALSE). 
# Le second est le résultat de la fonction si le premier argument vaut TRUE.
# Le troisième est le résultat de la fonction si le premier argument vaut FALSE.

recode_oui_non <- function(var) {
  var_recodee <- ifelse(var == "1","Oui", "Non")
  return(var_recodee)
}