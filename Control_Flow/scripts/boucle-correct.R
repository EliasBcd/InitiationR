# for (i in 1:10) {
#   if (i < 3) 
#     next
#   
#   print(i)
#   
#   if (i >= 5)
#     break
# }
# 
# Voici un exemple d'utilisation de next et break.
# next dira à R de passer à l'itération suivante dès que i est plus petit que 3, 
# de sorte que 1 et 2 ne seront pas affiché par print().
# break dit à R d'arrêter l'itération dès que i atteint la valeur 5, mais après 
# avoir affiché la valeur 5.
# 
# Essayez de faire une boucle ou R n'affiche que les valeurs paires inférieures à 8.
# Voici un début de code pour vous aider.

for (i in 1:20) {
  if (i %% 2 == 1) 
    next
  
  print(i)
  
  if (i >= 8)
    break
}
