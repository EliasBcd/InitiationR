# Écrire une fonction meteo qui prend un argument nommé temperature et effectue les actions suivantes :
#   
# - si temperature est inférieure à 0, renvoit “ça caille” 
# - si temperature est comprise entre 0 et 15, renvoit “fais pas chaud”
# - si temperature est comprise entre 15 et 30, renvoit “on est pas mal”
# - si temperature est supérieure à 30, renvoit “tous à Miribel”
#
# Tapez submit() dans la console après avoir enregistré le script une fois que vous avez fini



meteo <- function(temperature) {
  if (temperature < 0) {
    return("ça caille")
  } else if (temperature < 15) {
    return("fais pas chaud")
  } else if (temperature < 30) {
    return("on est pas mal")
  } else {
    return("tous à Miribel")
  }
}